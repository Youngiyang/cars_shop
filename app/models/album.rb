class Album < ActiveRecord::Base
  has_many :photos

  validates :name, presence: true, length: 2..16, uniqueness: true
end
