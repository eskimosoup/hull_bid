class AddCampaignSentToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :campaign_sent, :boolean, :default => false
  end
end
