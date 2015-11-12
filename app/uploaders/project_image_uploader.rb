class ProjectImageUploader < Chronicler::ImageUploader

  version :small do
    process :resize_to_fill => [159, 106]
  end
  
  version :large do
    process :resize_to_fill => [328, 217]
  end
  
  version :shadowbox do
    process :resize_to_limit => [800, 600]
  end

end
