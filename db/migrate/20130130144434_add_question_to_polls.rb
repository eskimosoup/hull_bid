class AddQuestionToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :question, :string
  end
end
