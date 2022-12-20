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
    return unless params[:id].to_i == current_user.id

    user = User.find(params[:id].to_i)
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user, notice: t('controllers.common.notice_update', name: Book.model_name.human) }
        format.json { render :show, status: :ok, location: user }
      else
        format.html { render :edit }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :postal_code, :address, :introduction)
  end
end
