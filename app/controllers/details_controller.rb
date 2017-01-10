class DetailsController < ApplicationController
  layout "frontend"
  
  def index
    # @id = params[:id]
    # # product
    # @product = Good.find(params[:id]).product
    # # goods
    # @goods = product.goods
    @id = params[:id]
    @photo_url = Photo.find( Good.find(params[:id]).photo_ids.split(',').first).img_url
    @good = Good.find(params[:id])

    good = Good.includes(product: { goods: [{ good_spec_options: { spec_option: :spec } }, { good_attr_options: { attr_option: :attr } }] }).find(params[:id])
        product = good.product
        goods = product.goods
        return_hash = {}
        return_hash['product'] = product.entity
        return_hash['goods'] = []
        goods.each do |good|
          return_hash['goods'].append(good.entity)
        end
        @return_hash =return_hash


    # @good = Good.find(params[:id]).specs

    # good = Good.includes(product: { goods: [{ good_spec_options: { spec_option: :spec } }, { good_attr_options: { attr_option: :attr } }] }).find(params[:id])
    #     pp product = good.product
    #     goods = product.goods
    #     @count = goods.count
    #     return_hash = {}
    #     @product = product.entity
    #     return_hash['goods'] = []
    #     goods.each do |good|
    #       return_hash['goods'].append(good.entity)
    #     end
    #     @return_hash = return_hash
    #     binding.pry
  end
end
