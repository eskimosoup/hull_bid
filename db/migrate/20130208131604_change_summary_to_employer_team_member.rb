class ChangeSummaryToEmployerTeamMember < ActiveRecord::Migration
  def change
    rename_column :team_members, :summary, :employer
    change_column :team_members, :employer, :string
  end
end
