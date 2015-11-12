class Banner < ActiveRecord::Base
  mount_uploader :image, BannerImageUploader
  
  validates :name, :link, :image, {:presence => true}
end
