class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])

    @comment = Comment.new(comment_content: params[:comment])
    @comment.article = @article
    @comment.user = current_user
    respond_to do |format|
      @comment.save
      format.js { render 'create.js.erb' }
    end
  end
end
