class BusinessImageUploader < Chronicler::ImageUploader

  version :show do
    process :resize_to_fit => [350, 120]
  end

end