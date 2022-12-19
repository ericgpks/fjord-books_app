# frozen_string_literal: true
require 'debug'

class UsersController < ApplicationController
  def index
    @users = User.order(:id).all.page params[:page]
  end
  def show
    @user = User.find(params[:id])
    binding.break
  end
  def edit
    @user = User.find(params[:id])
    binding.break
  end
  def update
    user = User.find(params[:id])
    user.save!
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :postal_code, :address, :introduction)
  end
end
