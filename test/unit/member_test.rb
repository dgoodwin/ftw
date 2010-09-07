require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  test "successful creation" do
    member = Member.new(:league => leagues(:newb), :user => users(:user001), 
          :account => accounts(:user001))
    assert member.save
  end

  test "only one membership per league" do
    # Admin is already a member of this league from the fixtures:
    member = Member.new(:league => leagues(:alien), :user => users(:admin),
          :account => accounts(:admin))
    assert !member.save
    assert member.errors[:user]
  end

  test "account must belong to user" do
    member = Member.new(:league => leagues(:newb), :user => users(:user001), 
          :account => accounts(:user002))
    assert !member.save
    assert member.errors[:account]
  end

end

