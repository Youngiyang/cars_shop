class SpecOption < ActiveRecord::Base
  belongs_to :spec
  has_many :good_spec_options
end
