class EmailImageUploader < Chronicler::ImageUploader

  version :newsletter do
    process :resize_to_fill => [160, 121]
  end
  
  version :solus do
    process :resize_to_fill => [560, 300]
  end

end
