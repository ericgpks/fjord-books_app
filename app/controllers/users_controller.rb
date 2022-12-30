# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @is_follow = @user.follow?(params[:id], current_user.id)
    @followings_count = followings.count
    @followers_count = followers.count
  end

  def follow
    follow_user_id = params[:user_id].to_i
    follow = Follow.new(
      follow_user_id: follow_user_id,
      follower_user_id: current_user.id
    )
    redirect_to users_path if follow.save
  end

  def unfollow
    unfollow_user_id = params[:user_id].to_i
    follow_record = Follow.find_by(follow_user_id: unfollow_user_id, follower_user_id: current_user.id)
    return if follow_record.nil?

    follow_record.destroy
    redirect_to users_path
  end

  def followings
    @followings = User.find(params[:id]).followings
  end

  def followers
    @followers = User.find(params[:id]).followers
  end
end
