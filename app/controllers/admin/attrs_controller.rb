class Admin::AttrsController < ApplicationController
  def create
    attr = Attr.new(attr_params)
      if attr.save
        render json: attr
      else

      end
  end

  private
  def attr_params
    params.require(:attr).permit(:key, :group_num)
  end
end
