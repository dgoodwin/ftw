require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @league = leagues(:newb)
    @user = users(:user001)
  end

  test "simple creation" do
    authenticate(@user.email, 'password')
    post :create, :league_id => @league.id

    lookedup = User.find(@user.id)
    assert_not_nil lookedup.members.detect { |m| m.league.id == @league.id }
  end

  # This may change someday soon:
  test "all members get host role" do
    authenticate(@user.email, 'password')
    post :create, :league_id => @league.id

    lookedup = User.find(@user.id)
    assert has_role(lookedup, 'host', @league.id)
  end
end

