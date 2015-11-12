class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :logo
      t.string :website
      t.boolean :display, :default => true
      t.timestamps
    end
  end
end
