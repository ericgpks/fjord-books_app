# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).all.page params[:page]
  end
  def show
    @user = User.find(current_user.id)
  end
  def edit
    @user = User.find(current_user.id)
  end
  def update
    user = User.find(current_user.id)
    user.save
    redirect_to users_path
  end
end
