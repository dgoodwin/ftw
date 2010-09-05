require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "simple create" do
    perm = Permission.new(:role => 'league_admin', 
        :user => users(:admin), :qualifier => 0)
    assert perm.save
  end

  test "create with invalid role" do
    perm = Permission.new(:role => 'akshdkjahs', 
        :user => users(:admin), :qualifier => 0)
    assert !perm.save
    assert perm.errors[:role].any?
  end
end
