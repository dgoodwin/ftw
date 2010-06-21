require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => @user.attributes
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => @user.to_param
    assert_response :success
  end

  test "should get edit" do
    authenticate(users(:two).login, 'admin')
    get :edit, :id => @user.to_param
    assert_response :success
  end

  test "should update user" do
    authenticate(users(:two).login, 'admin')
    put :update, :id => @user.to_param, :user => @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    authenticate(users(:two).login, 'admin')
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end

    assert_redirected_to users_path
  end

  def authenticate(username, password) 
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("%s:%s" \
        % [username, password])
  end


end
