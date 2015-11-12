class AddMobileToTeamMembers < ActiveRecord::Migration
  def change
    add_column :team_members, :mobile, :string
  end
end
