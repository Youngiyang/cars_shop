class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
