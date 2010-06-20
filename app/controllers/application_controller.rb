class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password| 
      user = User.where({'login' => user_name})[0]

      print "Found user:"
      print user

      user_name == 'admin' && password == 'password'  
    end  
  end

end
