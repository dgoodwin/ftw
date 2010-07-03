require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  setup do
    @round = rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rounds)
  end

  test "should get new" do
    authenticate(users(:two).login, 'admin')
    get :new, :season_id => seasons(:one).id
    assert_response :success
  end

  test "should create round" do
    authenticate(users(:two).login, 'admin')
    assert_difference('Round.count') do
      post :create, :round => @round.attributes, \
        :season_id => seasons(:one).id
    end

    assert_redirected_to round_path(assigns(:round))
  end

  test "should show round" do
    get :show, :id => @round.to_param
    assert_response :success
  end

#  test "should get edit" do
#    authenticate(users(:two).login, 'admin')
#    get :edit, :id => @round.to_param
#    assert_response :success
#  end

  test "should update round" do
    authenticate(users(:two).login, 'admin')
    put :update, :id => @round.to_param, :round => @round.attributes
    assert_redirected_to round_path(assigns(:round))
  end

  test "should destroy round" do
    authenticate(users(:two).login, 'admin')
    assert_difference('Round.count', -1) do
      delete :destroy, :id => @round.to_param
    end

    assert_redirected_to rounds_path
  end
end
