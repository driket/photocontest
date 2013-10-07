class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :title
      t.text :body
      t.datetime :date_start
      t.datetime :date_end
      t.integer :max_photos_per_user
      t.integer :max_vote_per_user
      t.datetime :vote_start
      t.datetime :vote_end

      t.timestamps
    end
  end
end
