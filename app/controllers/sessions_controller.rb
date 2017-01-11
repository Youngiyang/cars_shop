class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create, :logout]
  def create
    if params[:session][:checkbox] == "1"
      mobile = params[:session][:mobile]
      code = params[:session][:auth_code]
      @user = User.find_by(mobile: mobile)
      @user = User.create!(mobile: mobile) if !@user
      if AuthCode.valid_auth_code?(mobile, code)
        log_in @user
        redirect_to root_path
      end
    else
      redirect_to root_path
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

  def logout
    log_out if logged_in?
    redirect_to :root
  end

end
