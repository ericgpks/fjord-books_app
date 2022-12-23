# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :follows

  def followings
    follow_ids = Follow.where(follower_user_id: self.id).pluck(:follow_user_id)
    User.where(id: follow_ids)
  end

  def followers
    follower_ids = Follow.where(follow_user_id: self.id).pluck(:follower_user_id)
    User.where(id: follower_ids)
  end
end
