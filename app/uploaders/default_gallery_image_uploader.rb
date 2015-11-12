class DefaultGalleryImageUploader < Chronicler::ImageUploader

  version :show do
    process :resize_to_fill => [437, 176]
  end

end