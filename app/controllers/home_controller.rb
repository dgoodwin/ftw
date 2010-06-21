class HomeController < ApplicationController

  before_filter :authenticate, :only => [:login]

  def index
  end

  def login
  end

  def logout
    reset_session
    session[:logged_out] = true
    flash[:notice] = "Logged out, peace."
    redirect_to(root_path)
  end

end
