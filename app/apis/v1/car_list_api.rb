module V1
  class CarListAPI < Grape::API
    get "car_list/select" do
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
      present resources, using: ProductsEntity
    end
  end
end