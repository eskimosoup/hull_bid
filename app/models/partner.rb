class Partner < ActiveRecord::Base
  
  mount_uploader :logo, PartnerImageUploader
  validates :name, :logo, :website, {:presence => true}

end
