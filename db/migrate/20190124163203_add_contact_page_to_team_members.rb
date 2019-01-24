class AddContactPageToTeamMembers < ActiveRecord::Migration
  def change
    add_column :team_members, :contact_page, :boolean, default: false
  end
end
