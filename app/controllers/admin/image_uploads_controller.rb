class Admin::ImageUploadsController < ApplicationController
   def upload
    image = ImageUpload.new
    image.img_url = params[:upload_file]
    if image.save
      render json: {:success=> true, :msg=>'上传成功',:file_path=> image.img_url.url }
    else
      render json: { :success=> false }
    end
  end
end
