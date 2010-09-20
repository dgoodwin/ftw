require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase
  setup do
    @season = seasons(:alien_s1)
    @admin_user = User.find(users(:admin).id)
    @admin_user.permissions << permissions(:siteadmin)
    @admin_user.save
  end

  test "should get index" do
    get :index, :league_id => @season.league.id
    assert_response :success
    assert_not_nil assigns(:seasons)
  end

  test "should get new" do
    authenticate(users(:admin).email, 'admin')
    get :new, :league_id => leagues(:alien).id
    assert_response :success
  end

  test "should create season" do
    request.env["HTTP_REFERER"] = "/"
    authenticate(@admin_user.email, 'admin')
    assert_difference('Season.count') do
      post :create, :season => @season.attributes, \
        :league_id => leagues(:alien).id
    end
    assert_redirected_to league_seasons_path(leagues(:alien))
  end

  test "create season perm" do
    request.env["HTTP_REFERER"] = "/"
    authenticate(users(:user001).email, 'admin')

    assert_no_difference('Season.count') do
      post :create, :season => @season.attributes, \
        :league_id => leagues(:alien).id
    end
    assert_response :forbidden
  end

  test "should show season" do
    get :show, :id => @season.to_param, :league_id => @season.league.id
    assert_response :success
  end

# TODO: needs season relation to league coming from fixture
#  test "should get edit" do
#    get :edit, :id => @season.to_param
#    assert_response :success
#  end

  test "should update season" do
    authenticate(users(:admin).email, 'admin')
    put :update, :league_id => @season.league.id, :id => @season.to_param, :season => @season.attributes
    assert_redirected_to league_seasons_path(@season.league)
  end

  test "should destroy season" do
    authenticate(users(:admin).email, 'admin')
    assert_difference('Season.count', -1) do
      delete :destroy, :id => @season.to_param, :league_id => @season.league.id
    end

    assert_redirected_to league_seasons_path(@season.league)
  end
end
