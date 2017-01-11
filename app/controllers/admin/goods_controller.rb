class Admin::GoodsController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @goods = @product.goods.order(:status, created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def edit
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @good = Good.includes([good_spec_options: { spec_option: :spec }, good_attr_options: { attr_option: :attr }]).find(params[:id])
    @albums = Album.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @photos = Photo.order(created_at: :desc).where(album_id: 1)
    @content_photos = Good.photos(@good.photo_ids)
  end

  def update
    @good = Good.includes([good_spec_options: { spec_option: :spec }, good_attr_options: { attr_option: :attr }]).find(params[:id])
    begin
      ActiveRecord::Base.transaction do
        @good.update!(
          product_id: params[:product_id].to_i,
          name: params[:good][:name],
          photo_ids: params[:good][:photo_ids],
          source_from: params[:good][:source_from],
          current_price: params[:good][:current_price],
          market_price: params[:good][:market_price],
          extra_configration: params[:good][:more_config],
          registered_info: params[:good][:registered_info],
          in_stock: params[:good][:in_stock]
          )
        GoodSpecOption.where(good_id: @good.id).destroy_all
        all_specs = params[:good][:all_specs]
        all_specs.each_value do |spec|
          spec_option = SpecOption.where(spec_id: spec[0], value: spec[1]).first
          if spec_option.nil?
            spec_option = SpecOption.create!(spec_id: spec[0], value: spec[1])
          end
          GoodSpecOption.create!(good_id: @good.id, spec_option_id: spec_option.id)
        end
        attrs = params[:good][:all_attrs]
        GoodAttrOption.where(good_id: @good.id).destroy_all
        attrs.each_value do |attr|
          attr_option = AttrOption.where(attr_id: attr[0], value: attr[1]).first
          if attr_option.nil?
            attr_option = AttrOption.create!(attr_id: attr[0], value: attr[1])
          end
          GoodAttrOption.create!(good_id: @good.id, attr_option_id: attr_option.id)
        end
        product = Product.find(params[:product_id])
        if product.min_price > @good.current_price
          product.update_attributes!(min_price: @good.current_price)
        end
        redirect_to admin_brand_product_goods_path(brand_id: params[:brand_id], product_id: params[:product_id])
      end
    rescue Exception => e
      error = e.to_s
      render js: "alert('error!')"
    end
  end

  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @good = Good.new
    # 基本配置
    @attrs_one = Attr.get_gruop_attr(0).where(is_default: true)
    #车身
    @attrs_two = Attr.get_gruop_attr(1).where(is_default: true)
    #发动机
    @attrs_three = Attr.get_gruop_attr(2).where(is_default: true)
    #变速箱
    @attrs_four = Attr.get_gruop_attr(3).where(is_default: true)
    #底盘转向
    @attrs_five = Attr.get_gruop_attr(4).where(is_default: true)
    #车轮制动
    @attrs_six = Attr.get_gruop_attr(5).where(is_default: true)
    #重要配置
    @attrs_seven = Attr.get_gruop_attr(6).where(is_default: true)
    #更多配置
    @attrs_eight = Attr.get_gruop_attr(7).where(is_default: true)
    @specs = Spec.all
    @albums = Album.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @photos = Photo.order(created_at: :desc).where(album_id: 1)
  end

  def get_photos
    @photos = Photo.order(created_at: :desc).where(album_id: params[:album_id])
    render :partial => "photo", :object => @photos
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @good = Good.create!(
          product_id: params[:product_id].to_i,
          name: params[:good][:name],
          photo_ids: params[:good][:photo_ids],
          source_from: params[:good][:source_from],
          current_price: params[:good][:current_price],
          market_price: params[:good][:market_price],
          extra_configration: params[:good][:more_config],
          registered_info: params[:good][:registered_info],
          in_stock: params[:good][:in_stock]
          )
        all_specs = params[:good][:all_specs]
        all_specs.each_value do |spec|
          spec_option = SpecOption.where(spec_id: spec[0], value: spec[1]).first
          if spec_option.nil?
            spec_option = SpecOption.create!(spec_id: spec[0], value: spec[1])
          end
          GoodSpecOption.create!(good_id: @good.id, spec_option_id: spec_option.id)
        end
        attrs = params[:good][:all_attrs]
        attrs.each_value do |attr|
          attr_option = AttrOption.where(attr_id: attr[0], value: attr[1]).first
          if attr_option.nil?
            attr_option = AttrOption.create!(attr_id: attr[0], value: attr[1])
          end
          GoodAttrOption.create!(good_id: @good.id, attr_option_id: attr_option.id)
        end
        product = Product.find(params[:product_id])
        if product.min_price > @good.current_price
          product.update_attributes!(min_price: @good.current_price)
        end
        redirect_to admin_brand_product_goods_path(brand_id: params[:brand_id], product_id: params[:product_id])
      end
    rescue Exception => e
      error = e.to_s
      render js: "alert('error!')"
    end
  end
end
