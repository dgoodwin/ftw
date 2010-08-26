require 'test_helper'

class RaceResultTest < ActiveSupport::TestCase

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "simple create" do
    race = create_race
    result = create_race_result(race)
    x = result.save
    assert x
  end

  test "race required" do
    race = create_race
    result = create_race_result(race)
    result.race = nil
    assert !result.save
    assert result.errors[:race].any?
  end

  test "user required" do
    race = create_race
    result = create_race_result(race)
    result.user = nil
    assert !result.save
    assert result.errors[:user].any?
  end

  test "cannot create before race" do
    # Create a race in the future:
    race = create_race
    race.time = Time.now + (60 * 60 * 24 * 30) # one month in future
    assert race.save

    # Now try to submit results before the race has even happened:
    result = create_race_result(race)
    assert !result.save
  end

  def create_race
    event = events(:alien_s1_r1)
    users = []
    event.season.league.members.each do |member|
      users << member.user
    end
    race = Race.new(:event => event, :time => event.time, :instructions =>
        "Be there.", :index => 1, :users => users)
    return race
  end

  def create_race_result(race)
    result = RaceResult.new(:race => race,
        :user => users(:user001), :final => false)
    i = 1
    race.users.each do |u|
      result.rows << RaceResultRow.new(:position => i, :user => u)
      i = i + 1
    end
    return result
  end

  test "can submit only once" do
    race = create_race
    result = create_race_result(race)
    x = result.save
    assert x
    
    result = create_race_result(race)
    assert !result.save
    assert result.errors[:race].any?
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
  
  test "cannot duplicate user in results" do
    race = create_race
    result = RaceResult.new(:race => race,
        :user => users(:user001), :final => false)
    i = 1
    race.users.each do |u|
      result.rows << RaceResultRow.new(:position => i, :user => u)
    end
    # dupe the user in the last two spots:
    result.rows[-2].user = result.rows[-1].user
    assert !result.save
    assert result.errors[:rows].any?
  end

  test "all positions accounted for" do # ??? no shows ???
  end

  # no need to support multi-submissions just yet, need to see what's in gt5
  test "only one result per race" do
  end
  
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
