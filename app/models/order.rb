class Order < ActiveRecord::Base
  before_create :ensure_code
  belongs_to :user
  belongs_to :good

  private
    def ensure_code
      loop do
        prefix = Time.current.strftime("%y%m%d%H%M%4N")
        nums = (0..9).to_a
        postfix = nums.sample(4).join
        code = prefix + postfix
        unless Order.exists?(code: code)
          self.code = code
          break
        end
      end
    end
end
