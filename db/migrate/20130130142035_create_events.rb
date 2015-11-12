class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :headline
      t.text :summary
      t.text :main_content
      t.date :start_date
      t.date :end_date
      t.boolean :display, :default => true
      t.string :image
      t.string :image_alt

      t.timestamps
    end
  end
end
