require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    request.env["HTTP_REFERER"] = "/"
  end

   test "should get new" do
     authenticate(users(:lonelyuser).email, 'password')
     get :new, :league_id => leagues(:alien).id, :request_type => 'join_league'
     assert_response :success
   end

   test "should create request" do
     authenticate(users(:lonelyuser).email, 'password')
     assert_difference('Request.count') do
       create_join_league_request
     end
   end

   def create_join_league_request
     authenticate(users(:lonelyuser).email, 'password')
     req = Request.new(:user => users(:lonelyuser), :league => leagues(:alien))
     post :create, :request => req.attributes, :league_id => leagues(:alien).id, \
       :request_type => "join_league"
     sign_out(users(:lonelyuser))
     return assigns(:request)
   end

  test "join league approval" do
    authenticate(users(:leagueadmin).email, 'password')
    league = leagues(:alien)
    member_count = Member.where(["league_id = ?", league.id]).count
    req = create_join_league_request

    authenticate(users(:leagueadmin).email, 'password')
    get :approve, { 'id' => req.id }

    assert_raise (ActiveRecord::RecordNotFound) { Request.find(req.id) }
    #assert_nil Request.find(req.id)
    new_member_count = Member.where(["league_id = ?", league.id]).count
    assert_equal member_count + 1, new_member_count
  end

  test "join league deny" do
    league = leagues(:alien)
    member_count = Member.where(["league_id = ?", league.id]).count
    req = create_join_league_request

    authenticate(users(:leagueadmin).email, 'password')
    get :deny, { 'id' => req.id }

    assert_raise (ActiveRecord::RecordNotFound) { Request.find(req.id) }
    #assert_nil Request.find(req.id)
    new_member_count = Member.where(["league_id = ?", league.id]).count
    assert_equal member_count, new_member_count
  end

#   test "should get index" do
#     authenticate(users(:admin).email, 'password')
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:requests)
#   end

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
