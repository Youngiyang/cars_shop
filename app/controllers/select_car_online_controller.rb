class SelectCarOnlineController < ApplicationController
    layout "frontend"

    def advanced_select
      @brands = Brand.all.order(:sort_order)
      @categories = Category.all
      @products = Product.all.order(is_recommended: :desc, is_hot: :desc)
      @params = params
      if params[:brand_id]
        @products = @products.where("brand_id = ?", params[:brand_id])
      end
      if params[:max] && params[:min]
        @products = @products.where("min_price <= :max AND min_price>= :min", { max: params[:max], min: params[:min] })
      end
      if params[:category_id]
        @products = @products.where("category_id = ?", params[:category_id])
      end
      @products = @products.paginate(page: params[:page], per_page: 12)
      respond_to do |format|
        format.html
        format.js
      end
    end
end
