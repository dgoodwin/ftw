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
          'edit_user'
      ])
    elsif role == 'host'
      return NewRole.new('host', [
          'host_race'
      ])
    elsif role == 'league_creator'
      return NewRole.new('league_creator', [
          'create_league',
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
          'host_race',
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
  
  # Examines a users permissions looking for one for the given role 
  # with the given qualifier. If no qualifier is given, look for a 
  # perm with qualifier 0. (site-wide)
  def has_role(user, role_key, qualifier=0)
    result = user.permissions.detect { |p| p.role == role_key \
        and p.qualifier == qualifier }
    not result.nil?
  end

end
