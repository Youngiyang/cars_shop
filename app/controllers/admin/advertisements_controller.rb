class Admin::AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    if @advertisement.save
      redirect_to admin_advertisement_path(@advertisement)
    else
      render :new
    end
  end


  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def update
  end

  def edit
  end

    private 
      def advertisement_params
        params.require(:advertisement).permit(:img_url, :link, :description, :position)
      end
end
