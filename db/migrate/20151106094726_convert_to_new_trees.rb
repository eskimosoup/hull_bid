class ConvertToNewTrees < ActiveRecord::Migration

  class Willow::Tree < ActiveRecord::Base
    has_many :branches
  end

  def up
    add_column :willow_branches, :tree, :string, :after => :id
    add_column :willow_branches, :sturdy, :boolean, :default => false
    add_column :willow_branches, :can_have_children, :boolean, :default => false
    add_column :willow_branches, :primary, :boolean, :default => false

    Willow::Branch.reset_column_information

    Willow::Branch.where("tree_id != '' AND tree_id IS NOT NULL").each do |branch|
      branch.update_attribute(:tree, Willow::Tree.find(branch.tree_id).name)
    end

    remove_column :willow_branches, :tree_id
    drop_table :willow_trees
  end

  def down
    create_table :willow_trees do |t|
      t.string :name
      t.text :description
    end
    add_column :willow_branches, :tree_id, :integer

    Willow::Branch.reset_column_information

    Willow::Branch.where("tree != '' AND tree IS NOT NULL").each do |branch|
      branch.update_attribute(:tree_id, Willow::Tree.find_or_create_by_name(branch.tree).id)
    end

    remove_column :willow_branches, :tree
    remove_column :willow_branches, :sturdy
    remove_column :willow_branches, :can_have_children
    remove_column :willow_branches, :primary
  end

end
