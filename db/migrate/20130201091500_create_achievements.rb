class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.text :summary
      t.text :main_content
      t.date :date
      t.boolean :display, :default => true
      t.string :image
      t.string :image_alt

      t.timestamps
    end
  end
end
