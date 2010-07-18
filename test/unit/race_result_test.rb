require 'test_helper'

class RaceResultTest < ActiveSupport::TestCase

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "simple create" do
    race = create_race
    result = RaceResult.new(:race => race,
        :user => users(:user001), :final => false)
    x = result.save
    assert x
  end

  test "race required" do
    result = RaceResult.new(:user => users(:user001), :final => false)
    assert !result.save
    assert result.errors[:race].any?
  end

  test "user required" do
    race = create_race
    result = RaceResult.new(:race => race,
        :final => false)
    assert !result.save
    assert result.errors[:user].any?
  end

  test "cannot create before race" do
    # Create a race in the future:
    race = create_race
    race.time = Time.now + (60 * 60 * 24 * 30) # one month in future
    assert race.save

    # Now try to submit results before the race has even happened:
    result = RaceResult.new(:race => race,
        :user => users(:user001), :final => false)
    assert !result.save
  end

  def create_race
    event = events(:alien_s1_r1)
    race = Race.new(:event => event, :time => event.time, :instructions =>
        "Be there.", :index => 1)
    return race
  end

  test "can submit only once" do
    race = create_race
    result = RaceResult.new(:race => race,
        :user => users(:user001), :final => false)
    x = result.save
    assert x
    
    result = RaceResult.new(:race => race,
        :user => users(:user001), :final => false)
    assert !result.save
    assert result.errors[:user].any?
  end

#   test "cannot create after final" do
#     race = create_race
#     result = RaceResult.new(:race => race,
#         :user => users(:admin), :final => true)
#     assert result.save
#     result = RaceResult.new(:race => race,
#         :user => users(:user002), :final => false)
#     assert !result.save
#     assert result.errors[:final].any?
#   end

  test "cannot edit after final" do
  end

  test "cannot edit another users result submission" do 
  end

  test "cannot create as another user" do 
  end

  test "cannot submit for race you were not in" do
  end

  # TODO: only league admin can submit final results

end
