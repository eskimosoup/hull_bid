class AddBoardRoleToTeamMembers < ActiveRecord::Migration
  def change
    add_column :team_members, :board_role, :string
  end
end
