module V1
  class CarDetailsAPI < Grape::API  
    namespace :details do
      get ':id' do
        good = Good.includes(product: { goods: [{ good_spec_options: { spec_option: :spec } }, { good_attr_options: { attr_option: :attr } }] }).find(params[:id])
        product = good.product
        goods = product.goods
        return_hash = {}
        return_hash['product'] = product.entity
        return_hash['goods'] = []
        goods.each do |good|
          return_hash['goods'].append(good.entity)
        end
        return_hash
      end
    end
  end
end