ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def authenticate(username, password) 
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("%s:%s" \
        % [username, password])
  end


  # Examines a users permissions looking for one which provides
  # the given role with the given qualifier.
  #
  # If no qualifier is given, look for a perm with qualifier 0. (site-wide)
  def has_role(user, role_key, qualifier=0)
    result = user.permissions.detect { |p| p.role.key == role_key \
        and p.qualifier == qualifier }
    not result.nil?
  end

end
