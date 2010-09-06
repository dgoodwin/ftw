require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  test "create" do
    account = Account.new(:user => users(:admin), :platform => platforms(:psn),
        :name => "My Account Name")
    assert account.save
  end

  test "one account per user per platform" do
    account = Account.new(:user => users(:admin), :platform => platforms(:psn),
        :name => "Account 1")
    assert account.save
    account = Account.new(:user => users(:admin), :platform => platforms(:psn),
        :name => "Account 2")
    assert !account.save
    assert account.errors[:user_id].any?
  end

  test "name unique within platform" do
    account = Account.new(:user => users(:admin), :platform => platforms(:psn),
        :name => "Account 1")
    assert account.save
    account = Account.new(:user => users(:user001), :platform => platforms(:psn),
        :name => "Account 1")
    assert !account.save
    assert account.errors[:name].any?

    # Same account name should be fine on another platform:
    account = Account.new(:user => users(:admin), :platform => platforms(:another),
        :name => "Account 1")
    assert account.save
  end

end
