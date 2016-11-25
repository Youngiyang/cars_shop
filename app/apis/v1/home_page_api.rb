module V1
  class HomePageAPI < Grape::API
    namespace :home do
      get 'brands' do
        brands_with_products = Brand.where(is_show: true).includes(:products).order(:sort_order)
        present brands_with_products, with: BrandsProductsEntity
      end

      get 'brands_all' do
        brands = Brand.all.order(:sort_order)
        products_recommended = Product.where(is_recommended: true)
        return_hash = {}
        return_hash['brands'] = []
        brands.each do |brand|
          return_hash['brands'].append({id: brand.id, cn_name: brand.cn_name, logo: brand.logo})
        end
        return_hash['recommended_cars'] = []
        products_recommended.each do |product_recommended|
          return_hash['recommended_cars'].append({ id: product_recommended.id, name: product_recommended.name })
        end
        return_hash
      end
    end
  end  
end