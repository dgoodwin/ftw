require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

#   def join_league(league, user)
#     @request = Request.new(:user => user, :league => league, 
#     get :approve, { 'id' => league.id }
#   end


  test "join league approval" do
#     member_count = Member.where(["league_id = ?", approval_league.id]).count
#     l = leagues(:alien)
#     authenticate(users(:lonelyuser).email, 'password')
#     join_league(l)
#     member_count = Member.where(["league_id = ?", approval_league.id]).count
  end

  test "join league deny" do
  end

  test "non-league admin cannot approve" do
  end

#   test "should get index" do
#     authenticate(users(:admin).email, 'password')
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:requests)
#   end

#    test "should get new" do
#      authenticate(users(:lonelyuser), 'password')
#      get :new, :league_id => leagues(:newb).id, :request_type => 'join_league'
#      assert_response :success
#    end

#   test "should create request" do
#     authenticate(users(:user001), 'password')
#     assert_difference('Request.count') do
#       post :create, :request => @request.attributes
#     end

#     assert_redirected_to request_path(assigns(:request))
#   end

#   test "should show request" do
#     get :show, :id => @request.to_param
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, :id => @request.to_param
#     assert_response :success
#   end

#   test "should update request" do
#     put :update, :id => @request.to_param, :request => @request.attributes
#     assert_redirected_to request_path(assigns(:request))
#   end

#   test "should destroy request" do
#     assert_difference('Request.count', -1) do
#       delete :destroy, :id => @request.to_param
#     end

#     assert_redirected_to requests_path
#   end
end
