require 'test_helper'

class RaceResultRowTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "valid time" do
    race = races(:alien_s1_r1_r1)
    row = RaceResultRow.new(:position => 1, :status => 'finished', 
      :user => users(:user001), :time => "1:15:30.731")
    #assert_equal 4530731, row.millis
    result = row.save
    assert result
  end

  test "no milliseconds is valid" do
    race = races(:alien_s1_r1_r1)
    row = RaceResultRow.new(:position => 1, :status => 'finished', 
      :user => users(:user001), :time => "1:15:30")
    assert row.save
  end

  test "no hours is valid" do
    race = races(:alien_s1_r1_r1)
    row = RaceResultRow.new(:position => 1, :status => 'finished', 
      :user => users(:user001), :time => "15:30.731")
    assert row.save
  end

  test "able to skip time specification" do
    race = races(:alien_s1_r1_r1)
    row = RaceResultRow.new(:position => 1, :status => 'finished', 
      :user => users(:user001), :time => "")
    assert row.save
  end

end
