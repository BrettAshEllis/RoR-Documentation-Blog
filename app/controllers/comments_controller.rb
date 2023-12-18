class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article) # redirect to the show action of the article controller
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
# Because of nesting, we have to get the article object from the article_id parameter for comments to keep track of which article they're attached to.

# Done with the rubyonrails.org getting started guide!