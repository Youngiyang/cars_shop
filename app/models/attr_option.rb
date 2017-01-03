class AttrOption < ApplicationRecord
  belongs_to :attr
  has_many :good_attr_options

  validates :value, presence: true, length: 1..16
end
