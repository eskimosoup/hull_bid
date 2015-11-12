class ArticleImageUploader < Chronicler::ImageUploader

  version :index do
    process :resize_to_fill => [82, 82]
  end
  
  version :show do
    process :resize_to_fit => [440, 1000]
  end

  version :newsletter do
    process :resize_to_fill => [180, 180]
  end

end
