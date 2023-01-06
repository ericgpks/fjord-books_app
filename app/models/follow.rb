# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower_user, class_name: 'User'
  belongs_to :follow_user, class_name: 'User'
  validates :follow_user_id, uniqueness: { scope: :follower_user_id }

  def follow?(follow_user_id, follower_user_id)
    Follow.find_by(follow_user_id: follow_user_id, follower_user_id: follower_user_id).present?
  end
end
