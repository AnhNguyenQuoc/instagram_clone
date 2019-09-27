class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    effect = [params[:effect]]
    @article = current_user.articles.build(article_params.merge(effect: effect))
    if @article.save!
      redirect_to root_path
      flash[:notice] = 'Create article success'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to show_user_path(current_user)
      flash[:notice] = "Delete success"
    end
  end


  private

  def article_params
    params.require(:article).permit(:content, images: [])
  end

end
