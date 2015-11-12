class EventGallery < ActiveRecord::Base
  
  belongs_to :event
  has_many :event_gallery_images, :dependent => :destroy 
  has_many :emails
  validates :name, :summary, :presence => true

  def image
    gallery_image = event_gallery_images.where(:display => true).order(:position).first
    if gallery_image
      gallery_image.image
    else
      nil
    end
  end

end
