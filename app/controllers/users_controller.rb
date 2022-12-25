# frozen_string_literal: true

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
    if current_user.update(user_params)
      redirect_to user, notice: t('controllers.common.notice_update', name: Book.model_name.human)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :postal_code, :address, :introduction)
  end
end
