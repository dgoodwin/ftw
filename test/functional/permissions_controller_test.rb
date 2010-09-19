require 'test_helper'

class PermissionsControllerTest < ActionController::TestCase

  def grant_perm(league, role, admin_user, target_user, diff)
    request.env["HTTP_REFERER"] = "/"
    authenticate(admin_user.email, 'password')

    perm = Permission.new(:role => role) 
    assert_difference('Permission.count', diff) do
      post :create, :permission => perm.attributes, 
        :user_id => target_user.id, :qualifier => league.id
    end
  end

  test "grant permission" do
    grant_perm(leagues(:alien), 'league_admin', users(:leagueadmin),
      users(:user001), 1)
  end

  test "revoke permission" do
    request.env["HTTP_REFERER"] = "/"
    authenticate(users(:leagueadmin).email, 'password')
    assert_difference('Permission.count', -1) do
      delete :destroy, :id => permissions(:user001host), :user_id => users(:user001).id
    end
  end

  test "grant roles permission required to grant" do
    grant_perm(leagues(:alien), 'league_admin', users(:user001),
      users(:user001), 0)
  end

  test "cannot give perms for another league" do
    grant_perm(leagues(:newb), 'league_admin', users(:leagueadmin),
      users(:newbuser), 0)
  end

  test "cannot give perms to non-member" do
    grant_perm(leagues(:alien), 'league_admin', users(:leagueadmin),
      users(:lonelyuser), 0)
  end

  test "cannot give site admin" do
    grant_perm(leagues(:alien), 'site_admin', users(:leagueadmin),
      users(:user001), 0)
  end

  test "cannot give user role" do
    grant_perm(leagues(:alien), 'user', users(:leagueadmin),
      users(:user001), 0)
  end

  test "cannot remove last league admin" do
    assert_equal 1, Permission.where(["role = 'league_admin' AND qualifier = ?",
      leagues(:alien).id]).length

    request.env["HTTP_REFERER"] = "/"
    authenticate(users(:leagueadmin).email, 'password')
    assert_difference('Permission.count', 0) do
      delete :destroy, :id => permissions(:leagueadmin), :user_id => users(:leagueadmin).id
    end
  end

end
