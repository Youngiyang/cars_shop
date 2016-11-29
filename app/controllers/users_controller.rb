class UsersController < ApplicationController
  layout "frontend"
  def personal
  end

  def appointment
  end
<<<<<<< HEAD

  def index
    @users = User.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def guide
  end

=======
>>>>>>> 6fa2d3108bd2859b71f3f5d92ce8af24681c99ab
end
