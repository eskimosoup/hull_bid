class CreateDefaultGalleryImages < ActiveRecord::Migration
  def change
    create_table :default_gallery_images do |t|
      t.string :name
      t.string :image
      t.boolean :display, :default => true
      t.integer :position

      t.timestamps
    end
  end
end
