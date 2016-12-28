class Order < ActiveRecord::Base
  before_create :ensure_code
  belongs_to :user, :counter_cache => true
  belongs_to :good

  validates :name, presence: true, length: 2..16
  VALID_MOBILE_REGEX = /\A(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}\z/
  validates :phone_num, presence: true, format: { with: VALID_MOBILE_REGEX }
  validates :requirements, allow_blank: true, length: { maximum: 500 }

  private
    def ensure_code
      loop do
        prefix = Time.current.strftime("%y%m%d%H%M%4N")
        nums = (0..9).to_a
        postfix = nums.sample(4).join
        code = prefix + postfix
        unless Order.exists?(order_cn: code)
          self.order_cn = code
          break
        end
      end
    end
end
