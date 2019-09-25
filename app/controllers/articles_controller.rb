class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save!
      redirect_to root_path
      flash[:notice] = "Create article success"
    end
  end


  private

  def article_params
    params.require(:article).permit(:content, images: [])
  end

end
