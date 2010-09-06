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
  end

  def require_perm(right_key, qualifier)
    u = get_current_user()

    # HACK: devise is tricky to customize and we cannot give roles on
    # user creation. Instead, check here for requests to edit a user
    # and allow if that user is the one requesting the edit.
    # TODO: Maybe move this inside find_perm and return an actual perm
    override = false
    if right_key == 'edit_user' and user_signed_in? and \
      get_current_user().id == qualifier
      override = true
    end

    perm = find_perm(u, right_key, qualifier)
    if perm.nil? and not override
      logger.warn("Forbidden: #{u.email} missing #{right_key}")
      flash[:error] = "Forbidden!"
      # TODO: maybe a better way to return this status, but hitting this 
      # should be rare as ideally, we hide all links you cannot access.
      redirect_to :back, :status => :forbidden
      return false
    else
      role = ""
      if not perm.nil? 
        role = perm.role
      end
      logger.info("ALLOW: #{u.email} has #{right_key} via #{role}")
      return true
    end
  end

end
