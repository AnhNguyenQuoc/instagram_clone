class LandingsController < ApplicationController
  def index
    @articles = Article.where(user_id: current_user.following.ids).or(Article.where(user_id: current_user.id)).order(created_at: :desc).page params[:page]
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.js { render 'index.js.erb'}
    end
  end

  def explore
    @users = User.where.not(id: current_user.following.ids).where.not(id: current_user.id).order('RANDOM()').limit(20)
  end
end
