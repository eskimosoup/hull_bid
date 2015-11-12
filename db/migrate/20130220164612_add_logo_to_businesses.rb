class AddLogoToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :logo, :string
    add_column :businesses, :logo_alt, :string
  end
end
