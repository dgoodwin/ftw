class HomeController < ApplicationController

  before_filter :authenticate, :only => [:login]

  def index
  end

  def login
  end

  def logout
    # Wipes out the user_id we had stored, among other things:
    reset_session

    session[:logged_out] = true
    flash[:notice] = "Logged out, peace."
    redirect_to(root_path)
  end

end
