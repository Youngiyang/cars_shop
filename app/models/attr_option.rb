class AttrOption < ApplicationRecord
  belongs_to :attr
  has_many :good_attr_options
end
