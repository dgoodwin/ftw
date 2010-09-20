require 'auth'

module ApplicationHelper

  include Auth

  def have_perm(right_key, qualifier) 
    return false if @luser.nil?
    not find_perm(@luser, right_key, qualifier).nil?
  end

  # Use this only when necessary, normally we check for perms:
  def have_role(role_key, qualifier) 
    return false if @luser.nil?
    return has_role(@luser, role_key, qualifier)
  end

  def link_to_if(condition, text, options)
    if condition
      link_to(text, options)
    else
      link_to("#{text} (disabled)", options)
    end
    
  end

end
