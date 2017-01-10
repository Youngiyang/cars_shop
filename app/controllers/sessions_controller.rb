class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  def create
    if params[:checkbox] == "1"
      mobile = params[:mobile]
      code = params[:auth_code]
      @user = User.find_by(mobile: mobile)
      @user = User.create!(mobile: mobile) if !@user
      if AuthCode.valid_auth_code?(mobile, code)
        log_in @user
        respond_to do |format|
          format.html
          format.js
        end
      else

      end
    end
  end

  def auth_code
    mobile = params[:session][:mobile]
    auth_code = AuthCode.new(
      mobile: mobile,
      auth_state: false,
      code: AuthCode.generate_code,
      expire_at: Time.now + 10.minutes
    )
    AuthCode.deactivate_old_auth_code(mobile)
    send_auth_code_sms(mobile, auth_code.code)
    auth_code.sent_at = Time.now
    auth_code.save!
  end
end
