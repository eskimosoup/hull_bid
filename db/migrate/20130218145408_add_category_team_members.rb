class AddCategoryTeamMembers < ActiveRecord::Migration
  def up
    add_column :team_members, :category, :string    
  end

  def down
    remove_column :team_members, :category    
  end
end
