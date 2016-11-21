class Good < ActiveRecord::Base
  belongs_to :product
  has_many :good_spec_options
  has_many :sepc_options, through: :good_spec_options
  has_many :good_attr_options

  validates_presence_of :product_id, :name, :source_from, :registered_info
  validates_length_of :name, in: 2..32
end
