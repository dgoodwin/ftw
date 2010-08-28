require 'digest/sha1'
require 'pp'

class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password| 
      user = User.where({'login' => user_name})[0]

      if user.nil?
        return false
      end

      hashed_password = Digest::SHA1.hexdigest(password)
      if hashed_password == user.hashed_password && \
          session[:logged_out] != true

        session[:user_id] = user.id
        flash[:notice] = "Welcome %s!" % user_name
        return true
      end
      session[:logged_out] = nil
    end  
  end

  def get_current_user
    user = nil
    if session[:user_id]
      user = User.find(session[:user_id])
    end
    return user
  end

end
