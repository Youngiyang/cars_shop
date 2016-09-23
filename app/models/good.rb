class Good < ActiveRecord::Base
  belongs_to :product
  has_many :good_spec_options
  has_many :good_attribute_options
end
