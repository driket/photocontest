class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :user_uid
      t.references :photo

      t.timestamps
    end
    add_index :votes, :photo_id
  end
end
