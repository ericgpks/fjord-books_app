class AddUniqueIndexFollow < ActiveRecord::Migration[6.1]
  def change
    add_index :follows, [:follow_user_id, :follower_user_id], unique: true
  end
end
