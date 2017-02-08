class Admin::ProductsController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
  def new
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.new
    @photos = Photo.order(created_at: :desc).where(album_id: 1)
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.build(product_params)
    if @product.save
      redirect_to admin_brand_products_path
    else
      render 'new'
    end
  end

  def edit
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:id])
    @content_photos = Good.photos(@product.content_photo_ids)
    @photos = Photo.order(created_at: :desc).where(album_id: 1)
  end

  def update
     product = Product.find(params[:id])
     product.update(product_params)
     if product.save
      redirect_to admin_brand_products_path
     else
      render "edit"
     end
  end
  def get_photos
    @photos = Photo.order(created_at: :desc).where(album_id: params[:album_id])
    render :partial => "photo", :object => @photos
  end
  private
  def product_params
    params.require(:product).permit(:name, :img_url, :brand_id, :category_id,:is_hot, :is_recommended, :recommended_sub_title, :recommended_words, :slogan, :min_price,:content_photo_ids)
  end
end

