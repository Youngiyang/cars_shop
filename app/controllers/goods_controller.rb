class GoodsController < ApplicationController
  layout "frontend"
  def index
    @product = Product.includes(:brand).find(params[:id])
    @goods = Good.where(product_id: params[:id])
    case params[:rank]
    when "价格"
      @goods = @goods.order(:current_price)
    when "时间"
      @goods = @goods.order(created_at: :desc)
    end
    case params[:supply]
    when "现货"
      @goods = @goods.where(in_stock: true)
    when "期货"
      @goods = @goods.where(in_stock: false)
    end
    @goods = @goods.paginate(page: params[:page], per_page: 6)
    respond_to do |format|
        format.html
        format.js
    end
  end
end
