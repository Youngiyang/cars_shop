class Advertisement < ApplicationRecord

  validates :description, length: { maximum: 500 }

  def entity
    { id: id, img_url: img_url, link: link, description: description,
      position: position, sort_order: sort_order }
  end
end
