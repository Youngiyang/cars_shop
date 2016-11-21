class Attr < ApplicationRecord
  has_many :attr_options
  belongs_to :attr_group
end
