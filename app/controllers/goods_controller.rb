class GoodsController < ApplicationController
  layout false
  def index
    
  end

  def show
    @good = Good.find(params[:id])
    @spec_options =[]
    @good.good_spec_options.each do |good_spec_option|
      @spec_options << good_spec_option.spec_option.value
    end
  end
end
