require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should show user" do
    get :show, :id => @user.to_param
    assert_response :success
  end

  test "should get edit" do
    authenticate(users(:admin).email, 'admin')
    get :edit, :id => @user.to_param
    assert_response :success
  end

  test "should update user" do
    authenticate(users(:admin).email, 'admin')

    # Hack in the password again:
    attributes = @user.attributes
    attributes['password'] = 'password'

    put :update, :id => @user.to_param, :user => attributes
    assert_redirected_to user_path(assigns(:user))
  end

end
