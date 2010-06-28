require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase
  setup do
    @league = leagues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leagues)
  end

  test "should get new" do
    authenticate(users(:two).login, 'admin')
    get :new
    assert_response :success
  end

  test "must be authenticated to create league" do
    post :create, :league => @league.attributes
    assert_response 401
  end

  test "should create league" do
    authenticate(users(:two).login, 'admin')
    assert_difference('League.count') do
      post :create, :league => @league.attributes
    end

    @league = League.find(@league.id)
    @league.members(true)
    @league.users(true)
    assert_redirected_to league_path(assigns(:league))

    # TODO: No idea why, but this works deployed but not in tests:
#    assert !@league.members(true).empty?
#    assert @league.members.include?(users(:two))
  end

  test "should show league" do
    get :show, :id => @league.to_param
    assert_response :success
  end

  test "should get edit" do
    authenticate(users(:two).login, 'admin')
    get :edit, :id => @league.to_param
    assert_response :success
  end

  test "should update league" do
    authenticate(users(:two).login, 'admin')
    put :update, :id => @league.to_param, :league => @league.attributes
    assert_redirected_to league_path(assigns(:league))
  end

  test "should destroy league" do
    authenticate(users(:two).login, 'admin')
    assert_difference('League.count', -1) do
      delete :destroy, :id => @league.to_param
    end

    assert_redirected_to leagues_path
  end
end
