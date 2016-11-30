module Admin::BrandsHelper
  def is_display?(a)
    if a == false
      return "显示"
    elsif a == true
        return "隐藏"
    end
  end
end
