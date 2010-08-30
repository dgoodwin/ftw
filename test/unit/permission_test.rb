require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "simple create" do
    perm = Permission.new(:role => roles(:league_admin), 
        :user => users(:admin), :qualifier => 0)
    assert perm.save
  end
end
