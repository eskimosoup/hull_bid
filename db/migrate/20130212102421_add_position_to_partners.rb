class AddPositionToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :position, :integer, :default => 0
  end
end
