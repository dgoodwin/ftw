require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "successful create" do
    e = Event.new(:time => "2010-01-31", :season => seasons(:alien_s1), 
        :name => "Round 40", :track => tracks(:monza), :laps => 5)
    assert e.save
  end

  test "name required" do
    e = Event.new(:time => "2010-01-31", :season => seasons(:alien_s1), 
        :track => tracks(:monza), :laps => 5)
    assert !e.save
    assert e.errors[:name].any?
  end

  test "season required" do
    e = Event.new(:time => "2010-01-31", :name => "Round 40", 
        :track => tracks(:monza), :laps => 5)
    assert !e.save
    assert e.errors[:season].any?
  end

  test "time required" do
    e = Event.new(:season => seasons(:alien_s1), :name => "Round 40", 
        :track => tracks(:monza), :laps => 5)
    assert !e.save
    assert e.errors[:time].any?
  end

end
