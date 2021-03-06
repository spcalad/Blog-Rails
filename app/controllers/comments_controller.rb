class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(:user_id => current_user.id))
    redirect_to :controller => 'articles', :action => 'show', :id => @article.id
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to :controller => 'articles', :action => 'show', :id => @article.id
  end

  private
  def comment_params
    params.require(:comment).permit( :user_id, :body)
  end
end
