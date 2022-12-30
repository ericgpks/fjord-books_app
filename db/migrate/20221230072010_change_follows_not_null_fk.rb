class ChangeFollowsNotNullFk < ActiveRecord::Migration[6.1]
  def change
    change_column_null :follows, :follow_user_id, false
    change_column_null :follows, :follower_user_id, false
  end
end
