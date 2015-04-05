class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.merge(:user_id => current_user.id))

    if @article.save
      redirect_to @article
    else
      render 'new'
  end

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article =  Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to :controller => 'articles', :action => 'index'
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def index
    @articles = Article.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :user_id)
    end

end
