class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :role
      t.text :summary
      t.string :email
      t.string :phone
      t.boolean :board_member
      t.boolean :display, :default => true
      t.string :image
      t.string :image_alt

      t.timestamps
    end
  end
end
