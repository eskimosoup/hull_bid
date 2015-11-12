class AddEventGalleryIdToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :event_gallery_id, :integer
  end
end
