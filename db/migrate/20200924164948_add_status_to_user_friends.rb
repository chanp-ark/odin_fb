class AddStatusToUserFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :user_friends, :status, :integer
  end
end
