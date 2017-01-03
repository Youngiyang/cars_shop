class AuthCodeController < ApplicationController
  include AuthCodeHelper

  def send_msg
    mobile = params[:mobile]
    auth_code = AuthCode.new(
      mobile: mobile,
      code: AuthCode.generate_code,
      auth_state: false,
      expire_at: Time.now + 10.minutes
    )
    AuthCode.deactivate_old_auth_code(mobile)
    if send_auth_code_sms(mobile, auth_code.code)
      auth_code.save!
      render json: { message: "success" }
    else
      render json: { message: "fail" }
    end
  end
end
