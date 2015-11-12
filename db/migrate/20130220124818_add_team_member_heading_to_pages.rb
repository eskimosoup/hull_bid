class AddTeamMemberHeadingToPages < ActiveRecord::Migration
  def change
    add_column :pages, :team_member_heading, :string
  end
end
