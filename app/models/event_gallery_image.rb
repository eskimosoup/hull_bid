class EventGalleryImage < ActiveRecord::Base

  belongs_to :event_gallery
  mount_uploader :image, EventGalleryImageUploader

  before_create :default_image_alt

  validates :event_gallery_id, :presence => true

  def default_image_alt
    self.image_alt ||= File.basename(image.filename, '.*').titleize if image?
  end

end
