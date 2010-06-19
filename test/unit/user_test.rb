require 'test_helper'
require 'digest/sha1'

class UserTest < ActiveSupport::TestCase
    test "password hashing" do
        pass = "secret"
        expected = Digest::SHA1.hexdigest(pass)
        user = User.new(:login => "newguy")
        user.password = pass
        assert user.save
        user = User.find(user.id)
        assert_equal expected, user.hashed_password
    end

    test "logins must be unique" do
    end
end
