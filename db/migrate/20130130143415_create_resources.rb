class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :summary
      t.string :link
      t.string :document
      t.string :document_title
      t.boolean :display, :default => true


      t.timestamps
    end
  end
end
