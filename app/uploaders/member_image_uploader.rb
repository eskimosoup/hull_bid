class MemberImageUploader < Chronicler::ImageUploader

  version :index do
    process :resize_to_fill => [99, 114]
  end

end
