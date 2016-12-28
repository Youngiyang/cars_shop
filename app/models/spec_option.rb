class SpecOption < ActiveRecord::Base
  belongs_to :spec
  has_many :good_spec_options
  has_many :goods, through: :good_spec_options

  validates_presence_of :spec_id, :value
  validates_length_of :value, in: 2..16
end
