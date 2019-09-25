class LandingsController < ApplicationController
  def index
    @articles = Article.where(user_id: current_user.following.ids).or(Article.where(user_id: current_user.id)).order(created_at: :desc)
    @comment = Comment.new
  end
end
