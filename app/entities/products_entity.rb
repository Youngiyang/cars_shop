class ProductsEntity < Grape::Entity
  root 'products'

  expose :id, :name, :brand_id, :img_url, :category_id, :slogan, :min_price
end