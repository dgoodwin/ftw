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
    user = User.where(:email => username)[0]
    sign_in user
  end


  # Examines a users permissions looking for one which provides
  # the given role with the given qualifier.
  #
  # If no qualifier is given, look for a perm with qualifier 0. (site-wide)
  def has_role(user, role_key, qualifier=0)
    result = user.permissions.detect { |p| p.role == role_key \
        and p.qualifier == qualifier }
    not result.nil?
  end

end

class ActionController::TestCase
  include Devise::TestHelpers
end
