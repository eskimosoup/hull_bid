class AddPageIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :page_id, :integer
  end
end
