class CreateBusinessHighlights < ActiveRecord::Migration
  def change
    create_table :business_highlights do |t|
      t.string :name
      t.text :summary
      t.text :main_content
      t.date :date
      t.boolean :display, :default => true
      t.string :image
      t.string :image_alt
      t.string :image_2
      t.string :image_2_alt
      t.string :image_3
      t.string :image_3_alt
      t.string :image_4
      t.string :image_4_alt

      t.timestamps
    end
  end
end
