class AddListNameToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :list_name, :string
  end
end
