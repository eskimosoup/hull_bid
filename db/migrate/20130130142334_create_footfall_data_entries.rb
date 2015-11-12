class CreateFootfallDataEntries < ActiveRecord::Migration
  def change
    create_table :footfall_data_entries do |t|
      t.integer :year
      t.integer :month
      t.integer :count

      t.timestamps
    end
  end
end
