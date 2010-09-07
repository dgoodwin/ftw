class Users::RegistrationsController < Devise::RegistrationsController

  # Override devise create method
  def create
    # Call the super method:
    super

    # The parent method defines this:
    user = resource 

    # Add the initial roles for this user:
    # If no site admins exist, grant perm for this user:
    pp resource
    site_admins_count = Permission.where(["role = ?", "site_admin"]).length
    if site_admins_count == 0
      logger.warn("No site admins found, granting role to user: #{resource.id}")
      resource.permissions << Permission.new(:role => 'site_admin', :qualifier => 0)
    end

    # All users should get a role to edit themselves:
    resource.permissions << Permission.new(:role => 'user', :qualifier => resource.id)

    # And a role to create leagues:
    resource.permissions << Permission.new(:role => 'league_creator', :qualifier => 0)

    # Save the new permissions:
    resource.save
  end

end

