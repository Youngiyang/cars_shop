class BrandsProductsEntity < Grape::Entity
  root 'brands'
  expose :id, :en_name, :cn_name, :logo, :is_show, :sort_order
  expose :products, using: ProductsEntity
end