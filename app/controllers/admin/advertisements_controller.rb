class Admin::AdvertisementsController < ApplicationController
  def index
  end

  def new
    @advertisement = Advertisement.new
  end


  def show
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
