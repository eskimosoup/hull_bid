class AddPositionToEventGallery < ActiveRecord::Migration
  def change
    add_column :event_galleries, :position, :integer
  end
end
