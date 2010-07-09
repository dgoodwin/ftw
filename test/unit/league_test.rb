require 'test_helper'

class LeagueTest < ActiveSupport::TestCase

  # Replace this with your real tests.
  test "name is unique" do
    l = League.new(:name => leagues(:alien).name, :description => "something")
    assert !l.save
    assert l.errors[:name].any?
  end

  test "name required" do
    l = League.new
    assert !l.save
    assert l.errors[:name].any?
  end

end
