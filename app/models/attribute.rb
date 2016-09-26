class Attribute < ActiveRecord::Base
  belongs_to :attribute_group
  has_many :attribute_options

  validates_presence_of :attribute_group_id, :key
  validates_length_of :key, in: 2..16
end
