class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.string :link
      t.string :image
      t.integer :position
      t.boolean :display, :default => true

      t.timestamps
    end
  end
end
