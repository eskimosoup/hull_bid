class DefaultGalleryImage < ActiveRecord::Base

  mount_uploader :image, DefaultGalleryImageUploader
  validates :name, :image, :presence => true


end
