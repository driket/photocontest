class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :user_uid
      t.integer :contest_id

      t.timestamps
    end
  end
end
