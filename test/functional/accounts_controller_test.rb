require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
    @user = users(:user001)
    @user.permissions << Permission.new(:qualifier => @user.id, :role => "user")
    assert @user.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    authenticate(users(:user001).email, 'password')
    get :new, :user_id => users(:user001).id
    assert_response :success
  end

  test "should create account" do
    authenticate(users(:user001).email, 'password')
    account = Account.new(:user => users(:user001), :platform => platforms(:another),
        :name => "Account 1")
    assert_difference('Account.count') do
      post :create, :account => account.attributes, \
        :user_id => users(:user001).id
    end

    assert_redirected_to account_path(assigns(:account))
  end

  test "should show account" do
    get :show, :id => @account.to_param
    assert_response :success
  end

end
