require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:alien_s1_r1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    authenticate(users(:admin).login, 'admin')
    get :new, :season_id => seasons(:alien_s1).id
    assert_response :success
  end

  test "should create event" do
    authenticate(users(:admin).login, 'admin')
    assert_difference('Event.count') do
      post :create, :event => @event.attributes, \
        :season_id => seasons(:alien_s1).id
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, :id => @event.to_param
    assert_response :success
  end

#  test "should get edit" do
#    authenticate(users(:admin).login, 'admin')
#    get :edit, :id => @event.to_param
#    assert_response :success
#  end

  test "should update event" do
    authenticate(users(:admin).login, 'admin')
    put :update, :id => @event.to_param, :event => @event.attributes
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    authenticate(users(:admin).login, 'admin')
    assert_difference('Event.count', -1) do
      delete :destroy, :id => @event.to_param
    end

    assert_redirected_to events_path
  end

  test "should schedule races" do
    authenticate(users(:admin).login, 'admin')
    league = create_league(16)
    event = league.seasons[0].events[0]
    get :schedule, {'id' => event.id}
    assert_redirected_to event_path(event)

    assert_equal 1, event.races.length
    event.races.each do |race|
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

    event = Event.new(:season => season)
    season.events << event
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
