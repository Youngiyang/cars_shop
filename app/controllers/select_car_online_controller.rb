class SelectCarOnlineController < ApplicationController
    layout "frontend"
    def index

    end

    def advanced_select
      @brands = Brand.all.order(:sort_order)
      @products = Product.all.paginate(page: params[:page], per_page: 12)
                         .order(is_recommended: :desc, is_hot: :desc)
      @categories = Category.all
    end

    def select
      resources = Product.all.order(is_recommended: :desc, is_hot: :desc)
      if params[:brand_id]
        resources = resources.where("brand_id = ?", params[:brand_id])
      end
      if params[:max] && params[:min]
        resources = resources.where("min_price <= :max AND min_price>= :min", { max: params[:max], min: params[:min] })
      end
      if params[:category_id]
        resources = resources.where("category_id = ?", params[:category_id])
      end
      resources = resources.paginate(page: params[:page], per_page: 12)
      
    end
end
