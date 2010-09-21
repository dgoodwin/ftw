require 'test_helper'

class RacesControllerTest < ActionController::TestCase
  setup do
    @race = races(:alien_s1_r1_r1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:races)
  end

  test "should show race" do
    get :show, :id => @race.to_param
    assert_response :success
  end

  test "should allow host specification" do
    request.env["HTTP_REFERER"] = "/"
    user = users(:user001)
    authenticate(user.email, 'password')
    post :host, :id => @race.to_param
    
    # Look it up fresh:
    @race = Race.find(@race.id)
    assert_not_nil @race.host
    assert_equal @race.host.id, user.id
  end

  test "should block host specification if host already assigned" do
    # Define a race host:
    @race.host = users(:user001)
    @race.save
    
    user2 = users(:user002)
    authenticate(user2.email, 'password')
    post :host, :id => @race.id
    
    @race = Race.find(@race.id)
    assert_not_nil @race.host

    # Should still be the first user:
    assert_equal @race.host.id, users(:user001).id
  end

  test "should enforce host_race right" do
    request.env["HTTP_REFERER"] = "/"
    # This user has no host role:
    user = users(:user003)
    authenticate(user.email, 'password')
    post :host, :id => @race.id
    @race = Race.find(@race.id)
    assert_nil @race.host
  end

end
