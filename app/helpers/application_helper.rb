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

  def image_link
    link = "ohao5tmd8.bkt.clouddn.com/uploads/images/"
  end

  def send_auth_code_sms number, code
    content = "【铁皮网】验证码：#{code}"
    puts content
  end
end
