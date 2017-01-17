module AuthCodeHelper
  def send_auth_code_sms number, code
    if Rails.env == 'test'
      return true
    end
    params = {}
    params["apikey"] = "7325619288390082605811f263366ed7"
    params["mobile"] = number
    params["text"] = "【中艺车界】您的验证码是：#{code}。此验证码10分钟内有效。非本人操作，请忽略"
    uri = URI.parse("https://sms.yunpian.com/v2/sms/single_send.json")
    res = Net::HTTP::post_form(uri, params)
    puts params["text"]
    if JSON.load(res.body)['code'].to_i == 0
      true
    else
      false
    end
  end
end
