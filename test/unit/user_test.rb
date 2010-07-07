require 'test_helper'
require 'digest/sha1'

class UserTest < ActiveSupport::TestCase

  test "successful create with minimal info" do
    user = User.new(:login => "newguy", :password => "password")
    assert user.save
  end

  test "password hashing" do
    pass = "secret"
    expected = Digest::SHA1.hexdigest(pass)
    user = User.new(:login => "newguy")
    user.password = pass
    assert user.save
    user = User.find(user.id)
    assert_equal expected, user.hashed_password
  end

  test "login and password required" do
    user = User.new
    assert !user.save
    assert user.errors[:login].any?
  end

  test "login less than 40 characters" do
    user = User.new(:login => "a" * 41, :password => "password")
    assert !user.save
    assert user.errors[:login].any?
  end

  test "logins must be unique" do
    user = User.new(:login => users(:admin).login, :password => "password")
    assert !user.save
    assert user.errors[:login].any?
  end

#   test "password too short" do
#     # Minimum is 6 characters
#     user = User.new(:login => "newguy", :password => "passw")
#     assert !user.save
#     assert user.errors[:password].any?
#   end


end
