class OrdersController < ApplicationController
  layout 'frontend'

  def new
    @good = Good.includes(good_attr_options: { attr_option: :attr }).find(params[:good_id])
    @extra_configration = @good.extra_configration.split(",")
    @image = Good.photos(@good.photo_ids)[0]
  end

  def create
    order = Order.new(
      user_id: current_user.id,
      good_id: params[:good_id],
      name: params[:order][:name],
      phone_num: params[:order][:phone_num],
      province_id: params[:order][:province_id],
      city_id: params[:order][:city_id],
      requirements: params[:order][:requirements],
      status: 1
      )
    if order.save
      redirect_to personal_path(user_id: current_user.id)
    else
      redirect_to new_orders_path(good_id: params[:good_id])
    end
  end
end
