require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "simple create" do
    assert true
    role = Role.new(:name => "Test Role")
    role.rights << rights(:create_league)
    assert role.save

    role = Role.find(role.id)
    assert_equal(1, role.rights.length)
  end
end
