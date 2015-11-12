class AddTeamMemberIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :team_member_id, :integer
    add_column :pages, :team_member_introduction, :text
  end
end
