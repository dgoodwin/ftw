require 'test_helper'

class RaceResultsControllerTest < ActionController::TestCase
  setup do
    @race_result = race_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:race_results)
  end

  test "should get new" do
    authenticate(users(:admin).email, 'admin')
    get :new, :race_id => races(:alien_s1_r1_r1).id
    assert_response :success
  end

  # TODO: needs result rows added?
#  test "should create race_result" do
#    authenticate(users(:admin).email, 'admin')
#    assert_difference('RaceResult.count') do
#      post :create, :race_result => @race_result.attributes,
#        :race_id => races(:alien_s1_r1_r1).id, :user_id => users(:user001).id
#    end
#    assert_redirected_to race_result_path(assigns(:race_result))
#  end

  test "should show race_result" do
    get :show, :id => @race_result.to_param
    assert_response :success
  end

  test "should get edit" do
    authenticate(users(:admin).email, 'admin')
    get :edit, :id => @race_result.to_param
    assert_response :success
  end

  test "should not be able to edit another users results" do
    # TODO:
    authenticate(users(:user002).email, 'admin')
    get :edit, :id => @race_result.to_param
    assert_response :redirect
  end

#   test "should update race_result" do
#     put :update, :id => @race_result.to_param, :race_result => @race_result.attributes
#     assert_redirected_to race_result_path(assigns(:race_result))
#   end

  test "should destroy race_result" do
    authenticate(users(:admin).email, 'admin')
    assert_difference('RaceResult.count', -1) do
      delete :destroy, :id => @race_result.to_param
    end

    assert_redirected_to race_results_path
  end
end
