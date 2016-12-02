class Admin::ProductsController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.new
  end

  def create
    brand = Brand.find(params[:brand_id])
    product = brand.product.new(product_params)
  end
end
