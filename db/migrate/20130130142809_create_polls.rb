class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name
      t.text :summary
      t.text :response
      t.boolean :display, :default => true

      t.timestamps
    end
  end
end
