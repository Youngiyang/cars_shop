class DetailsController < ApplicationController
  layout "frontend"
  
  def index
    @good = Good.find(params[:id]).specs
  end
end
