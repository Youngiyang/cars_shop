module AuthCodeHelper
  def send_auth_code_sms number, code
    if Rails.env == 'test'
      return true
    end
    content = "验证码：#{code}，此验证码10分钟内有效。非本人操作，请忽略"
    puts content
    true
  end
end
