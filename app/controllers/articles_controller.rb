class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # new is a GET request, so we don't need to whitelist any attributes.
    @article = Article.new
  end

  def create
    # create is a POST request, so we need to whitelist the attributes that we want to allow to be updated.
    @article = Article.new(article_params)
    
    if @article.save
    # create saves the model object to the database and returns a boolean indicating whether or not the save was successful. If the save was successful, the model object will have its id attribute set to the id assigned to it by the database.
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @artitcle.update(article_params)
      redirect_to @Article
    else
      rend :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  private
    def article_params
      params.require(:article).permit(:title, :body)
      # a private method is a method that can only be called from within the class in which it is defined. In this case, the article_params method can only be called from within the ArticlesController class.
      # params.require(:article) returns an instance of ActionController::Parameters with the name of the model as the key. This is a security feature of Rails. It ensures that only permitted attributes can be used to update our models.
    end
end