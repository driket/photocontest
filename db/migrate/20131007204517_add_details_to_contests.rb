class AddDetailsToContests < ActiveRecord::Migration
  def change
    add_column :contests, :action_title, :string, :default => 'participer'
    add_column :contests, :description, :string
  end
end
