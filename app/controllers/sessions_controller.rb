class SessionsController < ApplicationController

  def new       
  end

  def create 

    user = User.find_by(username: params[:session][:username].downcase)

    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = "login successful"
        redirect_to user
    else
      flash.now[:alert] = "login failed"
      render 'new'
    end
  end

  def destroy 
    session[:user_id] = nil
    flash[:notice] = "logged out"
    redirect_to root_path
  end

  private

  def login_params
    params.require(:session).permit(:username, :password)
  end

end
