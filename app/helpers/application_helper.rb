module ApplicationHelper

  include Auth

  def breadcrumb(opts = {})
    html = "<p>"
    if opts[:league]
      league = opts[:league]
      html << link_to(league.name, league_path(league))
    end
    if opts[:season]
      season = opts[:season]
      html << " >> "
      html << link_to(season.name, season_path(season))
    end
    if opts[:event]
      event = opts[:event]
      html << " >> "
      html << link_to(event.name, event_path(event))
    end
    html << "</p>"
    return raw(html)
  end

  def have_perm(right_key, qualifier) 
    return false if @luser.nil?
    not find_perm(@luser, right_key, qualifier).nil?
  end

  def link_to_if(condition, text, options)
    if condition
      link_to(text, options)
    else
      link_to("#{text} (disabled)", options)
    end
    
  end

end
