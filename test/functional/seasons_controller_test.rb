require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase
  setup do
    @season = seasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasons)
  end

  test "should get new" do
    get :new, :league_id => leagues(:one).id
    assert_response :success
  end

  test "should create season" do
    assert_difference('Season.count') do
      post :create, :season => @season.attributes, \
        :league_id => leagues(:one).id
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
    put :update, :id => @season.to_param, :season => @season.attributes
    assert_redirected_to season_path(assigns(:season))
  end

  test "should destroy season" do
    assert_difference('Season.count', -1) do
      delete :destroy, :id => @season.to_param
    end

    assert_redirected_to seasons_path
  end
end
