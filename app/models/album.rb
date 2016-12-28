class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  validates :name, presence: true, length: 2..16, uniqueness: true
  validates :description, length: { maximum: 500 }
end
