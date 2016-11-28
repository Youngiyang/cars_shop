module ApplicationHelper
  def image_tag(source, options = {})
    if source
      super(source, options)
    else
      super('', options)
    end
     
  end

  def image_size
    size = "?imageView2/2/w/600"
  end
end
