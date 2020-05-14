class AddStandaloneToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :standalone, :boolean, default: false
  end
end
