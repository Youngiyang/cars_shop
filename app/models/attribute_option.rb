class AttributeOption < ActiveRecord::Base
  belongs_to :attribute
  has_many :good_attribute_options
end
