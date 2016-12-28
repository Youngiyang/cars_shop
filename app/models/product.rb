class Product < ActiveRecord::Base
  has_many :goods
  has_many :product_specs
  belongs_to :category
  belongs_to :brand

  validates_presence_of :name, :brand_id, :category_id
  validates :name, length: 2..32, uniqueness: true
  validates :recommended_sub_title, presence: true, length: 2..32, if: Proc.new { |product| product.is_recommended }
  validates :recommended_words, presence: true, length: 2..100, if: Proc.new { |product| product.is_recommended }
  validates :slogan, presence: true, length: 2..50
  validates :min_price, numericality: true, allow_nil: true

  def entity
    { id: id, name: name, brand_id: brand_id, 
      img_url: img_url, category_id: category_id, is_hot: is_hot,
      is_recommended: is_recommended, recommended_words: recommended_words,
      slogan: slogan, min_price: min_price }
  end
end
