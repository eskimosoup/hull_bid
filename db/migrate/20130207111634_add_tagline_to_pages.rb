class AddTaglineToPages < ActiveRecord::Migration
  def change
    add_column :pages, :tagline, :string
  end
end
