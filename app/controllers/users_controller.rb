class UsersController < ApplicationController

  layout "frontend"
  def personal
    @orders = current_user.orders
  end

  def appointment
  end

  def index
    @users = User.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def guide
  end

end
