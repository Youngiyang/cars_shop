class Admin::GoodsController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @goods = @product.goods.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
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
    good = Good.new(good_pramas)
    if good.save
    end
  end

  private
  def good_pramas
    params.require(:good).permit(:name, :source_from,:current_price, :market_price,:registered_info,:in_stock,:status)
  end
end
