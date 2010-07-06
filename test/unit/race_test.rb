require 'test_helper'

class RaceTest < ActiveSupport::TestCase

  test "simple race create" do
    round = rounds(:alien_s1_r1)
    race = Race.new
    race.round = round
    race.time = round.time
    race.instructions = "Just be there..."
    race.password = "password"
    race.users << users(:admin)
    race.users << users(:kaz)
    race.save
  end

end
