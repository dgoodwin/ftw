require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  setup do
    @round = rounds(:alien_s1_r1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rounds)
  end

  test "should get new" do
    authenticate(users(:admin).login, 'admin')
    get :new, :season_id => seasons(:alien_s1).id
    assert_response :success
  end

  test "should create round" do
    authenticate(users(:admin).login, 'admin')
    assert_difference('Round.count') do
      post :create, :round => @round.attributes, \
        :season_id => seasons(:alien_s1).id
    end

    assert_redirected_to round_path(assigns(:round))
  end

  test "should show round" do
    get :show, :id => @round.to_param
    assert_response :success
  end

#  test "should get edit" do
#    authenticate(users(:admin).login, 'admin')
#    get :edit, :id => @round.to_param
#    assert_response :success
#  end

  test "should update round" do
    authenticate(users(:admin).login, 'admin')
    put :update, :id => @round.to_param, :round => @round.attributes
    assert_redirected_to round_path(assigns(:round))
  end

  test "should destroy round" do
    authenticate(users(:admin).login, 'admin')
    assert_difference('Round.count', -1) do
      delete :destroy, :id => @round.to_param
    end

    assert_redirected_to rounds_path
  end

  test "should schedule races" do
    authenticate(users(:admin).login, 'admin')
    league = create_league(16)
    round = league.seasons[0].rounds[0]
    get :schedule, {'id' => round.id}
    assert_redirected_to round_path(round)

    assert_equal 1, round.races.length
    round.races.each do |race|
      assert_equal 16, race.users.length
    end
  end

  def create_league(member_count)
    name = "Test League %s" % rand(10000000)
    league = League.new(:name => name)
    (1..member_count).each do |i|
      user = User.new
      user.login = "user%s" % i
      user.save
      member = Member.new(:league => league, :user => user)
      league.members << member
      member.save
    end

    season = Season.new(:league => league, :name => "Season 1")
    season.save

    round = Round.new(:season => season)
    season.rounds << round
    league.seasons << season

    league.save
    
    assert_equal(member_count, league.members.length)

    return league
  end

  test "race sizes" do
    assert_equal([16], @controller.calc_race_sizes(16, 16))
    assert_equal([15], @controller.calc_race_sizes(15, 16))
    assert_equal([9, 8], @controller.calc_race_sizes(17, 16))
    assert_equal([2, 1], @controller.calc_race_sizes(3, 2))
    assert_equal([48, 48, 47, 47, 47], @controller.calc_race_sizes(237, 50))
  end

end
