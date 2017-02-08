class HomeController < ApplicationController
  layout "frontend"
  def index
    @brands_with_products = Brand.where(is_show: true).includes(:products).order(:sort_order)
    @brands = Brand.all.order(:sort_order)
    @products_recommended = Product.where(is_recommended: true)
    @advertisements_1 = Advertisement.where(position: 2) #car-right
    @ads_3 = Advertisement.where(position: 3)
    @banners = Advertisement.where(position: 1)
    @products_hot = Product.where(is_hot: true)
    @categories = Category.all
  end
end
