class Attr < ApplicationRecord
  has_many :attr_options
  def self.get_gruop_attr(group_number)
    attr =  Attr.where(group_num: group_number)
    return attr
  end
end
