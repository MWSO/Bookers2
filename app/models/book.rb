class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

def get_image
  if image.attached?
    image
  else
    "no_image_jpg"
  end
end

 def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join("app/assets/images/no_image.jpg")
    image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
  end
    image.variant(resize_to_limit: [width, height]).processed
 end

end
