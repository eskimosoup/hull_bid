class AddPositionToEventGalleryImage < ActiveRecord::Migration
  def change
    add_column :event_gallery_images, :position, :integer
    add_column :event_gallery_images, :display, :boolean, :default => true
  end
end
