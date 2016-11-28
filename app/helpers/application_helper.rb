module ApplicationHelper
  def image_tag(source, options = {})
    super(source, options) unless source.blank?
  end

  def image_size
    size = "?imageView2/2/w/600"
  end
end
