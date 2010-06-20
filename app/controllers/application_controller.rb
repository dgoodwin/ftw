require 'digest/sha1'

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
      hashed_password == user.hashed_password

    end  
  end

end
