class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :image_1
      t.string :caption_1
      t.string :image_2
      t.string :caption_2
      t.string :image_3
      t.string :caption_3
      t.string :image_4
      t.string :caption_4
      t.string :image_5
      t.string :caption_5
      t.boolean :display

      t.timestamps
    end
  end
end
