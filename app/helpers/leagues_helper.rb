module LeaguesHelper

  # Roles that are interesting to a league:
  LEAGUE_ROLES = [
    'league_admin',
    'host',
  ]

  # Displays list of permissions relevant to this league:
  def show_league_perms(league, user)
    results = ""
    user.permissions.each do |p|
      if LEAGUE_ROLES.include?(p.role) and p.qualifier == league.id
        results << ", " if results.length > 0
        results << p.role 
      end
    end
    return results
  end

end
