class RemoveBoardRoleFromTeamMember < ActiveRecord::Migration
  def up
    remove_column :team_members, :board_role
  end

  def down
    add_column :team_members, :board_role, :string
  end
end
