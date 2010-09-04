require 'test_helper'
require 'pp'


class AuthTest < ActiveSupport::TestCase

  include Auth

  def setup
    @user = User.new(:login => 'dummy')

    @quali_right = Right.where(:key => 'edit_league')[0]
    @quali_right.save
    @sitewide_right = Right.where(:key => 'create_league')[0]
    @sitewide_right.save

    role1 = Role.new(:name => 'qualified', :key => 'qualified_role', 
        :rights => [@quali_right])
    role1.save
    role2 = Role.new(:name => 'sitewide', :key => 'sitewide_role', 
        :rights => [@sitewide_right])
    role2.save
    @user.permissions << Permission.new(:user => @user, :role => role1, :qualifier => 1)
    @user.permissions << Permission.new(:user => @user, :role => role2, :qualifier => 0)
    @user.save
  end

  def test_can_do_something
    perm = find_perm(@user, @quali_right.key, 1)
    assert_not_nil perm
  end

  def test_can_do_something_site_wide
    assert_not_nil = find_perm(@user, @sitewide_right.key, 0)
    assert_not_nil = find_perm(@user, @sitewide_right.key)
    assert_not_nil = find_perm(@user, @sitewide_right.key, 982137912)
  end

  def test_cannot_do_something_due_to_qualifier
    assert_nil find_perm(@user, @quali_right.key, 1938723)
  end

  def test_cannot_do_something
    assert_nil find_perm(@user, Right.where(:key => 'edit_user')[0].key, 5)
  end

  def test_non_existant_right
    assert_raise(RuntimeError) {
      find_perm(@user, "notarealkey", 4)
    }
  end


end

