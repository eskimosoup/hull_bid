class PageImageUploader < Chronicler::ImageUploader
  
  version :show do
    process :resize_to_fit => [656, 1000]
  end

  version :show_small do
    process :resize_to_fit => [440, 1000]
  end

end
