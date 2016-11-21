class Photo < ActiveRecord::Base
  belongs_to :album

  validates_presence_of :album_id, :name, :img_url
end
