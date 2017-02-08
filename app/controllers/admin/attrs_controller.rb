class Admin::AttrsController < ApplicationController
  before_action :authenticate_admin!
  def create
    attr = Attr.find_by(key: params[:attr][:key])
    if attr
       render json: attr
    else
      attr = Attr.new(attr_params)
      if attr.save
        render json: attr
      end
    end
  end

  private
  def attr_params
    params.require(:attr).permit(:key, :group_num)
  end
end
