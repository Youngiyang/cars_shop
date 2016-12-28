class Attr < ApplicationRecord
  has_many :attr_options

  validates :key, presence: true, length: 2..16, uniqueness: true
  validates :group_num, presence: true, inclusion: { in: 0..8 }
end
