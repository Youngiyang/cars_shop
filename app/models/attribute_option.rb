class AttributeOption < ActiveRecord::Base
  belongs_to :attribute
  has_many :good_attribute_options

  validates_presence_of :attribute_id, :value
  validates_length_of :value, in: 2..16
end
