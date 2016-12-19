class Admin::GoodsController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @goods = @product.goods.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @good = Good.new
  end
end
