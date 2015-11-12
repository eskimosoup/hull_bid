class DropPolls < ActiveRecord::Migration
  def up
    drop_table :polls
    drop_table :poll_answers
  end

  def down
    create_table :polls
    create_table :poll_answers
  end
end
