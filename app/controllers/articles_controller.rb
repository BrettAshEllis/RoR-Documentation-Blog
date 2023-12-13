class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
      # a private method is a method that can only be called from within the class in which it is defined. In this case, the article_params method can only be called from within the ArticlesController class.
      # params.require(:article) returns an instance of ActionController::Parameters with the name of the model as the key. This is a security feature of Rails. It ensures that only permitted attributes can be used to update our models.
    end
end