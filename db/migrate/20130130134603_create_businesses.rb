class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :town
      t.string :postcode
      t.string :telephone
      t.string :email
      t.string :website
      t.boolean :display, :default => true
     
      t.timestamps
    end
  end
end
