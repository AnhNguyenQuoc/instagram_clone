class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:follow_id])

    current_user.follower_with(@user)
    respond_to do |format|
      format.js { render 'create.js.erb' }
    end
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)

    respond_to do |format|
      format.js { render 'create.js.erb' }
    end
  end
end
