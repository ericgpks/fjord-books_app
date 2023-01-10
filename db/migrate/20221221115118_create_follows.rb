class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.bigint :follow_user_id
      t.bigint :follower_user_id

      t.timestamps
    end
  end
end
