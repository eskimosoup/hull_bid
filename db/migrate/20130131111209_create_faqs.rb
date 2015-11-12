class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.text :question
      t.text :answer
      t.boolean :display, :default => true
      t.integer :position
      t.timestamps
    end
  end
end
