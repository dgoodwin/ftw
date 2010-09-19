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
        role = get_role(p.role)
        results << role.name
        if have_perm('grant_roles', league.id)
          results << " (" << link_to("X", user_permission_path(user, p), :confirm => "Remove role?", :method => :delete) << ")"
        end
        results << "<br/>"
      end
    end
    return raw(results)
  end

end
