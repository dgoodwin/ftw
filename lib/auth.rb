class NewRole
  attr_accessor :key, :rights

  def initialize(key, rights)
    @key = key
    @rights = rights
  end

end

module Auth

  def get_role(role)

    if role == 'user'
      return NewRole.new('user', [
          'create_league',
          'edit_user'
      ])
    elsif role == 'league_admin'
      return NewRole.new('league_admin', [
          'edit_league',
          'destroy_league',
          'create_season',
          'edit_season',
          'destroy_season',
          'create_event',
          'edit_event',
          'destroy_event',
          'schedule_event',
          'create_results',
          'edit_results',
          'destroy_results',
          'approve_results'
        ])
    elsif role == 'site_admin'
      return NewRole.new('site_admin', [
          'create_league',
          'destroy_league',
          'edit_league',
          'create_season',
          'edit_season',
          'destroy_season',
          'create_event',
          'destroy_event',
          'edit_event',
          'schedule_event',
          'create_results',
          'edit_results',
          'destroy_results',
          'approve_results',
          'edit_user',
          'destroy_user'
        ])
    else
      raise "Unknown role: #{role}"
    end
  end

  # Locate a permission for this user, return nil if none is found.
  def find_perm(user, right, qualifier=0)

    user.permissions.each do |perm|
      get_role(perm.role).rights.each do |r|
        # 0 indicates a site-wide qualifier:
        if r == right and (perm.qualifier == qualifier or 
            perm.qualifier == 0 or qualifier.nil?)
          return perm
        end
      end
    end
    return nil
  end

end
