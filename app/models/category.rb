class Category < ActiveRecord::Base
  has_many :products

  validates_presence_of :name, :sort_order
  validates_length_of :name, in: 2..16
end
