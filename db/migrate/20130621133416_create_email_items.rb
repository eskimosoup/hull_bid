class CreateEmailItems < ActiveRecord::Migration
  def up
    create_table :email_items  do |t|
      t.integer :email_id
      t.string :email_item_type
      t.integer :email_item_id
      t.integer :position, :default => 0
    end
  end

  def down
    drop_table :email_items
  end
end
