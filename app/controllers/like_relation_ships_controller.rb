class LikeRelationShipsController < ApplicationController

  def create
    @article = Article.find(params[:id])
    @like = LikeRelationShip.new(user_id: current_user.id, article_id: @article.id)

    if @like.save!
      ActionCable.server.broadcast 'like_channel',
                                   article_id: @article.id,
                                   html: render_to_string(partial: 'like_status', locals: {article: @article})
    end
  end

  def destroy
    @article = Article.find(params[:id])
    current_user.like_articles.delete(@article)
    ActionCable.server.broadcast 'like_channel',
                                 article_id: @article.id,
                                 html: render_to_string(partial: 'like_status', locals: {article: @article})

  end
end
