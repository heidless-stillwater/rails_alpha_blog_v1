
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index 
    @users = User.all
    
    users_per_page = 3
    @users = User.paginate(page: params[:page], per_page: users_per_page)

  end

  def show 
    # @articles = Article.joins(:user)
    # @articles = @user.articles
    articles_per_page = 5
    @articles = @user.articles.paginate(page: params[:page], per_page: articles_per_page)
  end

  def new
    @user = User.new
  end

  def create 
    # debugger
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to your Blog: #{@user.username}"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def edit 
  end

  def update 
    @user.update(user_params)

    if @user.save 
      flash[:notice] = "Edit successfully saved"
      redirect_to @user
    else 
      redirect_to 'edit'
    end
  end

  def destroy  
    @user.destroy
    session[:user_id] = nil if current_user == @user
    flash[:notice] = "Account and all associated Articles successfully removed."
    redirect_to articles_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end

  def require_same_user
    if @user != current_user && !current_user.admin?
      flash[:alert] = "You can only Edit or Delete your own Profile..."
      redirect_to @user
    end
  end
end
