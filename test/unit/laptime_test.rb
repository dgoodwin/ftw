require 'laptime'
require 'test/unit'

class LapTimeTest < Test::Unit::TestCase

  include LapTime

  def laptime_check(laptime_str, expected_int)
    assert_equal expected_int, laptime_string_to_int(laptime_str)
  end

  def test_full_laptime_to_int
    laptime_check("1:23:57.139", 5037139)
  end

  def test_seconds_only
    laptime_check("10", 10000)
  end

  def test_seconds_and_millis
    laptime_check("10.399", 10399)
  end

  def test_minutes_seconds_and_millis
    laptime_check("15:10.399", 910399)
  end

  def test_minutes_and_seconds
    laptime_check("15:10", 910000)
  end

  def test_one_hour
    laptime_check("1:00:00", 3600000)
    laptime_check("1:00:00.000", 3600000)
    laptime_check("0:60:00.000", 3600000)
    laptime_check("60:00.000", 3600000)
  end

  def test_one_hour
    laptime_check("1:00:00", 3600000)
  end

end


