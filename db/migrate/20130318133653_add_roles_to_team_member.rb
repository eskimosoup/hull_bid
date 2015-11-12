class AddRolesToTeamMember < ActiveRecord::Migration
  def change
    add_column :team_members, :chair, :boolean
    add_column :team_members, :vice_chair, :boolean
  end
end
