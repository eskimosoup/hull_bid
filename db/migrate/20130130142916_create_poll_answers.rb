class CreatePollAnswers < ActiveRecord::Migration
  def change
    create_table :poll_answers do |t|
      t.string :answer
      t.integer :count, :default => 0
      t.integer :poll_id
      
      t.timestamps
    end
  end
end
