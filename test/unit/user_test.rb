require 'test_helper'
require 'digest/sha1'

class UserTest < ActiveSupport::TestCase

  test "successful create with minimal info" do
    user = User.new(:email => "newguy@example.com", :password => "password")
    assert user.save
  end

  test "email and password required" do
    user = User.new
    assert !user.save
    assert user.errors[:email].any?
  end

  test "email format" do
    user = User.new(:email => "a" * 41, :password => "password")
    assert !user.save
    assert user.errors[:email].any?
  end

  test "email must be unique" do
    user = User.new(:email => users(:admin).email, :password => "password")
    assert !user.save
    assert user.errors[:email].any?
  end

#   test "password too short" do
#     # Minimum is 6 characters
#     user = User.new(:email => "newguy", :password => "passw")
#     assert !user.save
#     assert user.errors[:password].any?
#   end


end
