class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @order = Order.find(params[:id])
    @stauts = [['1', '1'], ['2', '2']]
  end

  def update
    @order = Order.find(params[:id])
    if  @order.update(order_params)
      redirect_to admin_orders_index_path
    else
      render :edit
    end
  end

  def search
    @orders = Order.where("order_cn LIKE ?","%#{params[:order_cn]}%").paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.js
    end
  end

    private
        def order_params
           params.require(:order).permit(:order_cn,:user_id,:good_id,:name,:phone_num,:province_id,:city_id,:requirements,:status)
        end
end
