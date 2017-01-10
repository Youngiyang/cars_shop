class Good < ActiveRecord::Base
  belongs_to :product
  has_many :good_spec_options
  has_many :good_attr_options

  validates_presence_of :product_id, :name, :source_from, :registered_info
  validates_length_of :name, in: 2..32

  def entity
    { 
      id: id, product_id: product_id, name: name, photos: Good.photos(photo_ids), 
      source_from: source_from, current_price: current_price, 
      market_price: market_price, registered_info: registered_info, 
      in_stock: in_stock, status: status, specs: specs, attrs: attrs
    }
  end

  def configrations group_num
    arr = []
    good_attr_options.each do |good_attr_option|
    attr = good_attr_option.attr_option.attr
      if attr.group_num == group_num
        arr << attr.key
      end
    end
    arr
  end

  def attrs
    return_hash = {}
    self.good_attr_options.each do |good_attr_option|
      attr = good_attr_option.attr_option.attr
      return_hash[attr.group_num] = [] unless return_hash[attr.group_num]
      return_hash[attr.group_num] << { id: attr.id, key: attr.key, value: good_attr_option.attr_option.value }
    end
    return_hash
  end

  def specs
    return_hash = []
    self.good_spec_options.each do |good_spec_option|
      spec_option = good_spec_option.spec_option
      return_hash << { id: spec_option.spec_id ,key: spec_option.spec.name, value: spec_option.value }
    end
    return_hash
  end

  def self.photos ids
    if ids
      photos_a = ids.split(",")
      photos = Photo.find(photos_a)
      photos_url = []
      photos.each do |photo|
        photos_url << photo.img_url
      end
      photos_url
    else
      []
    end
  end
end
