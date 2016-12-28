class Consultation < ApplicationRecord
  validates :intention, presence: true, length: 2..32
  validates :province_id, presence: true
  validates :city_id, presence: true
  validates :name, presence: true, length: 2..16
  VALID_MOBILE_REGEX = /\A(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}\z/
  validates :phone_num, presence: true, format: { with: VALID_MOBILE_REGEX }
end
