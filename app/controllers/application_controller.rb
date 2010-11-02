require 'digest/sha1'
require 'pp'

class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  include Auth

  before_filter :set_luser

  private

  def get_current_user
    return current_user()
  end

  # Set the currently logged in user, can be referenced in all views for
  # permission checking, etc.
  def set_luser
    @luser = get_current_user()
    # Setup this users timezone:
    Time.zone = @luser.time_zone if @luser
  end

  def require_perm(right_key, qualifier)

    # Make sure we're dealing with an integer here:
    qualifier = qualifier.to_i

    u = get_current_user()

    perm = find_perm(u, right_key, qualifier)
    if perm.nil? 
      logger.warn("DENY: #{u.email} missing #{right_key}")

      # TODO: maybe a better way to return this status, but hitting this 
      # should be rare as ideally, we hide all links you cannot access.
      flash[:error] = "Forbidden!"
      redirect_to :back, :status => :forbidden
      return false

    else
      logger.info("ALLOW: #{u.email} has #{right_key} via #{perm.role}")
      return true
    end
  end

end
