require 'digest/sha1'
require 'pp'

class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  include Auth

  before_filter :set_luser

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

  # Set the currently logged in user, can be referenced in all views for
  # permission checking, etc.
  def set_luser
    @luser = get_current_user()
  end

  def require_perm(right_key, qualifier)
    u = get_current_user()
    perm = find_perm(u, right_key, qualifier)
    if perm.nil?
      logger.warn("Forbidden: #{u.login} missing #{right_key}")
      flash[:error] = "Forbidden!"
      # TODO: maybe a better way to return this status, but hitting this 
      # should be rare as ideally, we hide all links you cannot access.
      redirect_to :back, :status => :forbidden
      return false
    else
      logger.info("ALLOW: #{u.login} has #{right_key} via #{perm.role}")
      return true
    end
  end

end
