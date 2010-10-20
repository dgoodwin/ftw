require 'scoring'
require 'test/unit'

class SimplePointsStrategyTest < Test::Unit::TestCase

  def setup
    @strat = SimplePointsStrategy.new()
  end

  def test_first
    assert_equal 20, @strat.calc_points(1)
  end

  def test_ninth
    assert_equal 0, @strat.calc_points(9)
  end

end

class LeaderboardTest < Test::Unit::TestCase

  def create_row(user, position)
    return RaceResultRow.new(:user => user, :position => position)
  end

  def setup
    @result = RaceResult.new
    @result.rows = []
    @bob = User.new(:name => 'bob')
    @sam = User.new(:name => 'sam')
    @result.rows << create_row(@bob, 4)
    @result.rows << create_row(@sam, 1)
  end

  def test_single_result
    leaderboard = Leaderboard.new()
    leaderboard.process([@result])
    assert_equal 8, leaderboard.user_points[@bob]
    assert_equal 20, leaderboard.user_points[@sam]
  end

  def test_multi_result
    leaderboard = Leaderboard.new()
    leaderboard.process([@result, @result])
    assert_equal 16, leaderboard.user_points[@bob]
    assert_equal 40, leaderboard.user_points[@sam]
  end

  def test_sorting
    leaderboard = Leaderboard.new()
    leaderboard.user_points[@bob] = 10
    leaderboard.user_points[@sam] = 20
    leaderboard.user_points[@mary] = 5
    sorted = leaderboard.get_sorted_totals()
    assert_equal 3, sorted.length
    assert_equal @sam, sorted[0][0]
    assert_equal @bob, sorted[1][0]
    assert_equal @mary, sorted[2][0]
  end

end


