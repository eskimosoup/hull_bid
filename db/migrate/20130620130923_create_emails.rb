class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :template
      t.string :subject
      t.string :heading
      t.text :summary
      t.text :content
      t.string :image
      t.string :image_alt

      t.timestamps      
    end
  end
end
