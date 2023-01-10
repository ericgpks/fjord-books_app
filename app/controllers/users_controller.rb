# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show followings followers]
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show; end

  def follow
    follow = current_user.passive_relationships.new(follow_user_id: params[:id])
    if follow.save
      redirect_to users_path
    else
      render :show
    end
  end

  def unfollow
    unfollow_user_id = params[:id].to_i
    follow_record = Follow.find_by(follow_user_id: unfollow_user_id, follower_user_id: current_user.id)

    if follow_record&.destroy
      redirect_to users_path
    else
      render :show
    end
  end

  def followings
    @followings = @user.follow_users
  end

  def followers
    @followers = @user.follower_users
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
