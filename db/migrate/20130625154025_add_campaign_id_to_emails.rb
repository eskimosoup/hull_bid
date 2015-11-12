class AddCampaignIdToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :campaign_id, :string
  end
end
