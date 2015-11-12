class EventImageUploader < Chronicler::ImageUploader

  version :index do
    process :resize_to_fill => [82, 82]
  end
  
  version :show do
    process :resize_to_fit => [440, 1000]
  end

end
