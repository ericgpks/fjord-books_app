# frozen_string_literal: true

require 'debug'

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @followings_count = followings.count
    @followes_count = followers.count
  end

  def follow
    follow_user_id = params[:user_id].to_i
    follow = Follow.new(
      follow_user_id: follow_user_id,
      follower_user_id: current_user.id
    )
    if follow.save
      redirect_to users_path
    end
  end

  def followings
    @followings = User.find(params[:id]).followings
  end

  def followers
    @followers = User.find(params[:id]).followers
  end

end
