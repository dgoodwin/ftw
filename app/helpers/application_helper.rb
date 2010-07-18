module ApplicationHelper

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

end
