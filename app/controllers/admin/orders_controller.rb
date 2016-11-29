class Admin::OrdersController < ApplicationController
  def index
  end

  def new
    @orders = Order.new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

    private
        def order_params
            params.require(:order).permit(:order_cn, :user_id, :good_id, :name, :phone_num, :province_id, :city_id, :requirements, :status)
        end
end
