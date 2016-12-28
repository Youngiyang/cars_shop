class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
     @users = User.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
