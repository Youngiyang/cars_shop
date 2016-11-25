module V1
  class HomePageAPI < Grape::API
    namespace :home do
      get 'brands' do
        brands_with_products = Brand.all.includes(:products).order(:sort_order)
        present brands_with_products, with: BrandsProductsEntity
      end
    end
  end  
end