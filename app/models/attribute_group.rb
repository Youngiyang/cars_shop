class AttributeGroup < ActiveRecord::Base
  has_many :attributes

  validates :name, presence: true, length: 2..16
end
