class CreateEventGalleryImages < ActiveRecord::Migration
  def change
    create_table :event_gallery_images do |t|
      t.integer :event_gallery_id
      t.string :image
      t.string :image_alt
      t.timestamps
    end
  end
end
