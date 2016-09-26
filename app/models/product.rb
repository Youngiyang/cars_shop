class Product < ActiveRecord::Base
  has_many :goods
  has_many :product_spec_options
end
