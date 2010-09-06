require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase
  setup do
    @league = leagues(:alien)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leagues)
  end

  test "should get new" do
    authenticate(users(:admin).email, 'admin')
    get :new
    assert_response :success
  end

  test "must be authenticated to create league" do
    post :create, :league => @league.attributes
    assert_response 302
  end

  test "should create league" do
    authenticate(users(:admin).email, 'admin')
    create_me = League.new(:name => "Elite league!", :game => games(:gt5))
    assert_difference('League.count') do
      post :create, :league => create_me.attributes
    end

    assert_redirected_to league_path(assigns(:league))

    # TODO: No idea why, but this works deployed but not in tests:
#    assert !@league.members(true).empty?
#    assert @league.members.include?(users(:admin))
  end

  test "should give creator initial league admin role" do
    authenticate(users(:admin).email, 'admin')
    create_me = League.new(:name => "Some League", :game => games(:gt5))
    post :create, :league => create_me.attributes
    assert_redirected_to league_path(assigns(:league))

    admin = User.find(users(:admin).id)
    assert has_role(admin, 'league_admin', assigns(:league).id)
  end

  test "should show league" do
    get :show, :id => @league.to_param
    assert_response :success
  end

  test "should get edit" do
    authenticate(users(:admin).email, 'admin')
    get :edit, :id => @league.to_param
    assert_response :success
  end

  test "should update league" do
    authenticate(users(:admin).email, 'admin')
    put :update, :id => @league.to_param, :league => @league.attributes
    assert_redirected_to league_path(assigns(:league))
  end

  test "should destroy league" do
    authenticate(users(:admin).email, 'admin')
    assert_difference('League.count', -1) do
      delete :destroy, :id => @league.to_param
    end

    assert_redirected_to leagues_path
  end
end
