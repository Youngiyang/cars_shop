class Admin::BrandsController < ApplicationController
<<<<<<< HEAD
=======
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

  def new
    @brand = Brand.new
  end
>>>>>>> 6fa2d3108bd2859b71f3f5d92ce8af24681c99ab
end
