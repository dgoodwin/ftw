require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  test "only one membership per league" do
    # Admin is already a member of this league from the fixtures:
    member = Member.new(:league => leagues(:alien), :user => users(:admin))
    assert !member.save
  end
end

