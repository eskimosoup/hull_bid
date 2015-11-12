class BannerImageUploader < Chronicler::ImageUploader
  
  version :show do
    process :resize_to_limit => [960, 265]
  end

end
