require 'test_helper'

class RaceTest < ActiveSupport::TestCase

  test "simple race create" do
    event = events(:alien_s1_r1)
    race = Race.new(:event => event, :time => event.time, :instructions =>
        "Be there.", :index => 1)
    race.users << users(:admin)
    race.users << users(:kaz)
    race.save
  end

  test "index required" do
    event = events(:alien_s1_r1)
    race = Race.new(:event => event, :time => event.time, :instructions =>
        "Be there.")
    race.users << users(:admin)
    race.users << users(:kaz)

    assert !race.save
    assert race.errors[:index].any?
  end

end
