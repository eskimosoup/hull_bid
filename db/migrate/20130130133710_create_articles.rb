class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :headline
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
