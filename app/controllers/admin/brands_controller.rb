class Admin::BrandsController < ApplicationController
  def index
    @brands = Brand.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @brand = Brand.find(params[:id])
    if @brand.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    brand = Brand.find(params[:id])
    brand.update(brand_params)
    if brand.save
      redirect_to admin_brands_path
    else
      render "edit"
    end
  end

  def new
    @brand = Brand.new
  end

  def create
    brand = Brand.new(brand_params)
    if brand.save
      redirect_to admin_brands_path
    else
      render 'new'
    end
  end

  private
  def brand_params
    params.require(:brand).permit(:en_name, :cn_name, :logo, :sort_order,:is_show, :nationality)
  end
end
