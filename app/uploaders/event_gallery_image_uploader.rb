class EventGalleryImageUploader < Chronicler::ImageUploader

  version :small do
    process :resize_to_fill => [120, 120]
  end

  version :shadowbox do
    process :resize_to_fit => [800, 600]
  end

  version :newsletter do
    process :resize_to_fill => [180, 180]
  end

end
