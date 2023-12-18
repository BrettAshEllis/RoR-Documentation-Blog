class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article) # redirect to the show action of the article controller
end
# Because of nesting, we have to get the article object from the article_id parameter for comments to keep track of which article they're attached to.
private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
