# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :follows, dependent: :destroy
  validates :follow_user_id, :follower_user_id, presence: true
  validates :follow_user_id, uniqueness: { scope: :follower_user_id }

  def followings
    follow_ids = Follow.where(follower_user_id: id).pluck(:follow_user_id)
    User.where(id: follow_ids)
  end

  def followers
    follower_ids = Follow.where(follow_user_id: id).pluck(:follower_user_id)
    User.where(id: follower_ids)
  end
end
