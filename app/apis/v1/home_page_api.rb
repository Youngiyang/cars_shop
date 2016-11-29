module V1
  class HomePageAPI < Grape::API
    namespace :home_page do
      get '' do
        brands_with_products = Brand.includes(:products).order(:sort_order)
        products_recommended = Product.where(is_recommended: true)
        advertisements = Advertisement.all.order(:position)
        return_hash = {}
        return_hash['brands'] = {}
        return_hash['brands']['is_show'] = []
        i = 0
        brands_with_products.each do |brand|
          if brand.is_show
            return_hash['brands']['is_show'].append(brand.entity)
            return_hash['brands']['is_show'][i]['products'] = []
            brand.products.each do |product|
            return_hash['brands']['is_show'][i]['products'].append(product.entity)
            end
            i = i + 1
          end
        end
        return_hash['brands']['all'] = []
        brands_with_products.each do |brand|
          return_hash['brands']['all'].append(brand.entity)
        end
        return_hash['recommended_cars'] = []
        products_recommended.each do |product_recommended|
          return_hash['recommended_cars'].append(product_recommended.entity)
        end
        return_hash['advertisements'] = []
        advertisements.each do |advertisement|
          return_hash['advertisements'].append(advertisement.entity)
        end
        return_hash
      end
    end
  end
end