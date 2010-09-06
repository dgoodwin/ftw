require 'test_helper'
require 'pp'


class AuthTest < ActiveSupport::TestCase

  include Auth

  def setup
    @league_admin = User.new(:email => 'dummy@example.com')
    @site_admin = User.new(:email => 'siteadmin@example.com')

    @league_admin.permissions << Permission.new(:user => @league_admin, 
        :role => 'league_admin', :qualifier => 1)
    @site_admin.permissions << Permission.new(:user => @site_admin, 
        :role => 'site_admin', :qualifier => 0)
  end

  def test_can_do_something
    perm = find_perm(@league_admin, 'edit_league', 1)
    assert_not_nil perm
  end

  def test_can_do_something_site_wide
    assert_not_nil find_perm(@site_admin, 'destroy_league', 0)
    assert_not_nil find_perm(@site_admin, 'destroy_league')
    assert_not_nil find_perm(@site_admin, 'destroy_league', 982137912)
  end

  def test_cannot_do_something_due_to_qualifier
    assert_nil find_perm(@league_admin, 'edit_league', 1938723)
  end

  def test_cannot_do_something
    assert_nil find_perm(@league_admin, 'destroy_user', 5)
  end

end

