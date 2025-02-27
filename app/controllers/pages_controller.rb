class PagesController < ApplicationController

  def home
    @title = "Home"
    redirect_to articles_path if logged_in? 
  end

  def about
    @title = "Home"
  end

end
