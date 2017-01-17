class DetailsController < ApplicationController
  layout "frontend"
  skip_before_filter :verify_authenticity_token, only: [:consultation_create]
  
  def index
    # @id = params[:id]
    # # product
    # @product = Good.find(params[:id]).product
    # # goods
    # @goods = product.goods
    @consultation = Consultation.new
    @id = params[:id]
    @photo_url = Photo.find( Good.find(params[:id]).photo_ids.split(',').first).img_url
    @good = Good.find(params[:id])
    @product_id = @good.product.id
    @good_params = GoodSpecOption.find_by_sql ["select * from good_spec_options as g inner join spec_options as s on g.spec_option_id = s.id inner join specs as sp on s.spec_id = sp.id where g.good_id = ? ",@id]

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

  def fuel
    goods = Product.find(params[:id]).goods.pluck(:id)
    # @fule = Product.find_by_sql ["select * from products as p inner join goods as g on p.id = g.product_id inner join good_spec_options as gs on g.id = gs.good_id inner join spec_options as s on gs.spec_option_id = s.id where value = ? and p.id = ? ", '柴油',1]
    goodspec = GoodSpecOption.find_by_sql ["select * from good_spec_options as g inner join spec_options as s on g.spec_option_id = s.id inner join specs as sp on s.spec_id = sp.id where g.good_id = ? and name = '燃油'",params[:good_id]]
    product = Product.find_by_sql ["select * from products as p inner join goods as g on p.id = g.product_id inner join good_spec_options as gs on g.id = gs.good_id inner join spec_options as s on gs.spec_option_id = s.id where value = ? and p.id = ? ",goodspec.first.value,params[:id]];
    goods_id = []
    product.each do |p|
        goods_id << p.good_id
    end
    fuel = GoodSpecOption.find_by_sql ["select  *  from good_spec_options as g inner join spec_options as s on g.spec_option_id = s.id inner join specs as sp on s.spec_id = sp.id where g.good_id in (?)  ", goods_id]

    render json: fuel
  end

  def consultation_create
    consultation = Consultation.new(consultation_params)
    if consultation.save
        render json: {status: "ok"}
    else
        render json: {status: "no"}
    end
  end


  def spec
    # goods = GoodSpecOption.where(good_id: 1)
    # spec = []
    # goods.each do |t|
    #     spec << t.spec_option
    # end
    # render json: spec
     test = GoodSpecOption.find_by_sql("select * from good_spec_options as g inner join spec_options as s on g.spec_option_id = s.id inner join specs as sp on s.spec_id = sp.id where g.good_id in (1)")
    goods =  Product.find_by_sql("select * from products as p inner join goods as g on p.id = g.product_id ")
    product = Product.find_by_sql("select * from products as p inner join goods as g on p.id = g.product_id inner join good_spec_options as gs on g.id = gs.good_id inner join spec_options as s on gs.spec_option_id = s.id where value = '柴油' and p.id = 1 ")
    goodspec = GoodSpecOption.find_by_sql("select * from good_spec_options as g inner join spec_options as s on g.spec_option_id = s.id where g.good_id in (1,6,7)")
    goodspecs = Good.find_by_sql("select * from good_spec_options as g inner join spec_options as s on g.spec_option_id = s.id where g.good_id = 1")
    goodspec.first
    render json: test
  end

   private
    def consultation_params
       params.require(:consultation).permit(:intention, :province_id, :city_id, :name, :phone_num)
    end
end
