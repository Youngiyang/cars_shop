class Brand < ActiveRecord::Base
  has_many :products

  validates :en_name, length: 2..16, allow_nil: true
  validates :cn_name, presence: true, length: 2..16, uniqueness: true
  validates_presence_of :logo, :sort_order

  def entity
    { id: id, cn_name: cn_name, logo: logo, 
      sort_order: sort_order, is_show: is_show }
  end
end
