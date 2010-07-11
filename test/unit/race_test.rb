require 'test_helper'

class RaceTest < ActiveSupport::TestCase

  test "simple race create" do
    event = events(:alien_s1_r1)
    race = Race.new
    race.event = event
    race.time = event.time
    race.instructions = "Just be there..."
    race.password = "password"
    race.users << users(:admin)
    race.users << users(:kaz)
    race.save
  end

end
