require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "successful create" do
    e = Event.new(:time => Time.now, :season => seasons(:alien_s1))
    assert e.save
  end

  test "season required" do
    e = Event.new(:time => Time.now)
    assert !e.save
    assert e.errors[:season].any?
  end

  test "time required" do
    e = Event.new(:season => seasons(:alien_s1))
    assert !e.save
    assert e.errors[:time].any?
  end

  # TODO: test timezones
end
