class AddListIdToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :list_id, :string
  end
end
