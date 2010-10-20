
# Class to help keep track of the leaderboard when processing results:
class Leaderboard
  attr_reader :user_points

  def initialize()
    @points_strategy = SimplePointsStrategy.new()
    @user_points = {}
  end

  def process(results)
    results.each do |result|
      result.rows.each do |row|
        add_points(row.user, @points_strategy.calc_points( 
            row.position, result.race.users.length))
      end
    end
  end

  def add_points(user, points)
    if @user_points.has_key?(user)
      @user_points[user] += points
    else
      @user_points[user] = points
    end
  end

end

# Strategy for how many points are given for a particular race result row.
class SimplePointsStrategy
  def initialize()
    @points_for_position = {
      1 => 20,
      2 => 15,
      3 => 10,
      4 => 8,
      5 => 6,
      6 => 4,
      7 => 2,
      8 => 1
    }
  end

  # User and race may eventually be used for points systems based on the
  # skill/size of the field.
  def calc_points(position, out_of)
    if @points_for_position.has_key?(position)
      return @points_for_position[position]
    else
      return 0
    end
  end
end


