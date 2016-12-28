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
      get ':id/specs' do
        good = Good.includes(product: { goods: { good_spec_options: { spec_option: :spec } } }).find(params[:id])
        product = good.product
        goods = product.goods
        return_hash = {}
        return_hash['product_id'] = product.id
        goods.each do |good|
          good_spec_options = good.good_spec_options
          good_spec_options.each do |good_spec_option|
            spec_option = good_spec_option.spec_option
            spec = spec_option.spec.name
            if !return_hash.key?(spec)
              return_hash[spec] = []
              return_hash[spec].append(spec_option.value)
            else
              unless return_hash[spec].include?(spec_option.value)
                return_hash[spec].append(spec_option.value)
              end
            end
          end
        end
        return_hash
      end
    end
  end
end