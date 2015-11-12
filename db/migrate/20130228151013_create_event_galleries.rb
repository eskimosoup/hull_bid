class CreateEventGalleries < ActiveRecord::Migration
  def change
    create_table :event_galleries do |t|
      t.integer :event_id
      t.string :name
      t.text :summary
      t.boolean :display, :default => true

      t.timestamps
    end
  end
end
