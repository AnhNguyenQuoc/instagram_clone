class UsersController < ApplicationController
  def show
    @user = User.includes(:articles).order(created_at: :desc).find(params[:id])
  end

  def update_avatar
    if current_user.avatar.attach(params[:avatar])
      redirect_to show_user_path(current_user)
      flash[:notice] = 'Update avatar success!'
    end
  end
end
