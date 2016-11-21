class Spec < ActiveRecord::Base
  has_many :product_specs
  has_many :spec_options

  validates :name, presence: true, length: 2..16
end