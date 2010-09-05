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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    create_me = User.new(:email => "testguy@example.com", :password => "passwordakajshdkajhd")

    assert_difference('User.count') do
      attrs = create_me.attributes
      # Hack in password, the model already changed it to a hashed version:
      attrs['password'] = 'password'
      post :create, :user => attrs
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should give user role on creation" do
    create_me = User.new(:email => "testguy@example.com", 
        :password => "passwordakajshdkajhd")
    attrs = create_me.attributes
    post :create, :user => attrs

    looked_up = User.find(assigns(:user))
    assert has_role(looked_up, 'user', assigns(:user).id)
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

  test "should destroy user" do
    authenticate(users(:admin).email, 'admin')
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end

    assert_redirected_to users_path
  end


end
