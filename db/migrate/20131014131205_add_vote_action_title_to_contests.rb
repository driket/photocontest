class AddVoteActionTitleToContests < ActiveRecord::Migration
  def change
    add_column :contests, :vote_action_title, :string
  end
end
