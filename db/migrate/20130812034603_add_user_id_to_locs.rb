class AddUserIdToLocs < ActiveRecord::Migration
  def change
    add_column :locs, :user_id, :integer
    add_index :locs, :user_id
  end
end
