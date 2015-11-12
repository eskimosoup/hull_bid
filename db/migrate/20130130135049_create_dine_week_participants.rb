class CreateDineWeekParticipants < ActiveRecord::Migration
  def change
    create_table :dine_week_participants do |t|
      t.string :company_name
      t.text :address
      t.string :city
      t.string :postcode
      t.string :telephone
      t.string :email
      t.string :website
      t.boolean :bogof
      t.boolean :kids_eat_free
      t.boolean :display, :default => true
      t.boolean :ask_about_dine_week
      t.text :notes

      t.timestamps
    end
  end
end
