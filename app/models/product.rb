class Product < ActiveRecord::Base
  has_many :goods
  has_many :product_specs

  validates_presence_of :name, :brand_id, :category_id
  validates :name, length: 2..32, uniqueness: true
end