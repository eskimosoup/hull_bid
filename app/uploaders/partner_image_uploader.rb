class PartnerImageUploader < Chronicler::ImageUploader

  version :index do
    process :resize_and_pad => [160, 90, '#ffffff']
  end
  
end
