class Brand < ActiveRecord::Base
  has_many :products

  validates :en_name, length: 2..16, allow_nil: true
  validates :cn_name, length: 2..16, uniqueness: true
  validates_presence_of :cn_name, :logo, :sort_order
end
