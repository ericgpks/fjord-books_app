# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @follow_flag = Follow.where(follow_user_id: params[:id], follower_user_id: current_user.id).exists?
    @followings_count = followings.count
    @followes_count = followers.count
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
    follow_record = Follow.where(follow_user_id: unfollow_user_id, follower_user_id: current_user.id)
    return unless follow_record.exists?

    Follow.destroy([follow_record.ids])
    redirect_to users_path
  end

  def followings
    @followings = User.find(params[:id]).followings
  end

  def followers
    @followers = User.find(params[:id]).followers
  end
end
