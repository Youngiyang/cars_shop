class ImageUpload < ApplicationRecord
  mount_uploader :img_url, ImageUploader
end
