class BusinessHighlightImageUploader < Chronicler::ImageUploader

  version :index do
    process :resize_to_fill => [132, 132]
  end
  
  version :home do
    process :resize_to_fill => [132, 198]
  end
  
  version :show do
    process :resize_to_fill => [440, 290]
  end

end
