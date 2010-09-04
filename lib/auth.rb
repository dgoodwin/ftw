module Auth

  # Locate a permission for this user, return nil if none is found.
  def find_perm(user, right, qualifier=0)

    # Make sure we're asking for a right that exists:
    lookup = Right.where(:key => right)
    if lookup.length == 0
      raise "No such right: #{right}"
    end

    user.permissions.each do |perm|
      perm.role.rights.each do |r|
        if r.key == right and (perm.qualifier == qualifier)
          return perm
        end
      end
    end
    return nil
  end

end
