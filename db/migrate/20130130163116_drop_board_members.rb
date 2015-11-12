class DropBoardMembers < ActiveRecord::Migration
  def up
    drop_table :board_members
  end

  def down
    create_table :board_members do |t|
      t.string :name
      t.string :role
      t.string :email
      t.string :telephone
      t.text :summary
      t.boolean :display, :default => true
      t.integer :position
      t.string :image
      t.string :image_alt

      t.timestamps
    end
  end
end
