class Spec < ActiveRecord::Base
  has_many :product_specs
  has_many :spec_options
end
