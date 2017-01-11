class AuthCode < ApplicationRecord
  VALID_MOBILE_REGEX = /\A(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}\z/
  validates :mobile, presence: true, format: { with: VALID_MOBILE_REGEX }
  validates :code, presence: true
  # validates :auth_state, presence: true

  def self.generate_code
    ((0...9).to_a.sample(3) + (0...9).to_a.sample(3)).join()
  end

  def self.valid_auth_code?(mobile, code)
    target_auth_code = where(mobile: mobile, auth_state: false).last
    valid = false
    if target_auth_code && target_auth_code.activated?
      target_auth_code.update_attribute(:auth_state, true)
      if target_auth_code.code == code
        valid = true
      end
    end
    valid
  end

  def self.deactivate_old_auth_code(mobile)
    where(mobile: mobile, auth_state: false).update_all(auth_state: true)
  end

  def activated?
    !auth_state && Time.now < expire_at
  end
end
