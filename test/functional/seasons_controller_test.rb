require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase
  setup do
    @season = seasons(:alien_s1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasons)
  end

  test "should get new" do
    authenticate(users(:admin).login, 'admin')
    get :new, :league_id => leagues(:alien).id
    assert_response :success
  end

  test "should create season" do
    authenticate(users(:admin).login, 'admin')
    assert_difference('Season.count') do
      post :create, :season => @season.attributes, \
        :league_id => leagues(:alien).id
    end
    assert_redirected_to season_path(assigns(:season))
  end

  test "should show season" do
    get :show, :id => @season.to_param
    assert_response :success
  end

# TODO: needs season relation to league coming from fixture
#  test "should get edit" do
#    get :edit, :id => @season.to_param
#    assert_response :success
#  end

  test "should update season" do
    authenticate(users(:admin).login, 'admin')
    put :update, :id => @season.to_param, :season => @season.attributes
    assert_redirected_to season_path(assigns(:season))
  end

  test "should destroy season" do
    authenticate(users(:admin).login, 'admin')
    assert_difference('Season.count', -1) do
      delete :destroy, :id => @season.to_param
    end

    assert_redirected_to seasons_path
  end
end
