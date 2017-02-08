module Admin::BrandsHelper
  def is_display?(a)
    if a == false
      return "隐藏"
    elsif a == true
        return "显示"
    end
  end
end
