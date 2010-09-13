require 'auth'

module ApplicationHelper

  include Auth

  def breadcrumb(opts = {})
    html = "<p>"
    if opts[:league]
      league = opts[:league]
      html << "League: " 
      html << link_to(league.name, league_path(league))
    end
    if opts[:season]
      season = opts[:season]
      html << " >> Season: "
      html << link_to(season.name, season_path(season))
    end
    if opts[:event]
      event = opts[:event]
      html << " >> Event: "
      html << link_to(event.name, event_path(event))
    end
    if opts[:race]
      race = opts[:race]
      html << " >> Race: "
      html << link_to("Heat #{race.index}", race_path(race))
    end
    html << "</p>"
    return raw(html)
  end

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
