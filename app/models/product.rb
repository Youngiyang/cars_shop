class Product < ActiveRecord::Base
  has_many :goods
  has_many :product_specs
  belongs_to :category
  belongs_to :brand

  validates_presence_of :name, :brand_id, :category_id
  validates :name, length: 2..32, uniqueness: true

  def entity
    { id: id, name: name, brand_id: brand_id, 
      img_url: img_url, category_id: category_id, is_hot: is_hot,
      is_recommended: is_recommended, recommended_words: recommended_words,
      slogan: slogan, min_price: min_price }
  end
end
