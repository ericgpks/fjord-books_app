# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_relationships, class_name: 'Follow', foreign_key: :follower_user_id, dependent: :destroy
  has_many :passive_relationships, class_name: 'Follow', foreign_key: :follow_user_id, dependent: :destroy
  has_many :follower_users, through: :active_relationships, source: :follow_user
  has_many :follow_users, through: :passive_relationships, source: :follower_user

  def follow(other_user)
    active_relationships.create(follow_user_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(follow_user_id: other_user.id).destroy
  end

  def follow?(follow_user_id, follower_user_id)
    Follow.find_by(follow_user_id: follow_user_id, follower_user_id: follower_user_id).present?
  end
end
