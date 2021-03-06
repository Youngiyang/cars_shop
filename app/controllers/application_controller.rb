class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  include SessionsHelper
  include UsersHelper

  def after_sign_in_path_for(resource_or_scope)
   admin_guide_path
  end


  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

end
