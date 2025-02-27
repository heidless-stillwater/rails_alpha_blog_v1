class ArticlesController < ApplicationController
before_action :set_article, only: [:show, :edit, :update, :destroy]
before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    per_page = 5
    @articles = Article.paginate(page: params[:page], per_page: per_page)

    # @articles = Article.all
  end

  def show
    # debugger
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # debugger
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render :new
    end
  end

  def update 
    # debugger 
    @article.update(article_params)

    if @article.save
      flash[:notice] = "Article was updated successfuly."
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy 
   @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if @article.user != current_user && !current_user.admin?
      flash[:alert] = "You can only Edit or Delete your own article..."
      redirect_to @article
    end
  end
end
