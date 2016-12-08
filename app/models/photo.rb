class Photo < ActiveRecord::Base
  # before_validation { self.name = img_url.send(:original_filename) }
  belongs_to :album
  # mount_uploader :img_url, ImageUploader

  validates_presence_of :album_id, :name, :img_url
end
