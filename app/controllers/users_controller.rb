# frozen_string_literal: true
require 'debug'

class UsersController < ApplicationController
  def index
    @users = User.order(:id).all.page params[:page]
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
    else
      redirect_to users_path
    end
  end
  def update
    if params[:id].to_i == current_user.id
      user = User.find(params[:id])
      user.save!
    end
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :postal_code, :address, :introduction)
  end
end
