require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase
  setup do
    @league = leagues(:alien)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leagues)
  end

  test "should get new" do
    authenticate(users(:admin).email, 'admin')
    get :new
    assert_response :success
  end

  test "must be authenticated to create league" do
    post :create, :league => @league.attributes
    assert_response 302
  end

  test "should create league" do
    authenticate(users(:admin).email, 'admin')
    create_me = League.new(:name => "Elite league!", :game => games(:gt5), 
      :racing_type => 'sports',
      :membership => 'open', :skill_level => 'advanced')
    assert_difference('League.count') do
      post :create, :league => create_me.attributes
    end

    assert_redirected_to league_path(assigns(:league))
    members = Member.where(["league_id = ?", assigns(:league).id])
    assert_equal 1, members.length
  end

  test "should give creator initial roles" do
    authenticate(users(:admin).email, 'admin')
    create_me = League.new(:name => "Some League", :game => games(:gt5),
      :racing_type => 'sports',
      :membership => 'open', :skill_level => 'advanced')
    post :create, :league => create_me.attributes
    assert_redirected_to league_path(assigns(:league))

    admin = User.find(users(:admin).id)
    assert has_role(admin, 'league_admin', assigns(:league).id)
  end

  test "should show league" do
    get :show, :id => @league.to_param
    assert_response :success
  end

  test "should get edit" do
    authenticate(users(:admin).email, 'admin')
    get :edit, :id => @league.to_param
    assert_response :success
  end

  test "should update league" do
    authenticate(users(:admin).email, 'admin')
    put :update, :id => @league.to_param, :league => @league.attributes
    assert_redirected_to league_path(assigns(:league))
  end

  test "should destroy league" do
    authenticate(users(:admin).email, 'admin')
    assert_difference('League.count', -1) do
      delete :destroy, :id => @league.to_param
    end

    assert_redirected_to leagues_path
  end

  test "league admin can view admin page" do
    authenticate(users(:leagueadmin).email, 'password')
    get :admin, {'id' => @league.id}
    assert_response :success 
  end

  test "must be league admin to view admin page" do
    request.env["HTTP_REFERER"] = "/"
    authenticate(users(:user001).email, 'password')
    get :admin, {'id' => @league.id}
    assert_response :forbidden 
  end

  test "join open league" do
    open_league = leagues(:newb)
    member_count = Member.where(["league_id = ?", open_league.id]).count
    authenticate(users(:lonelyuser).email, 'password')
    get :join, {'id' => open_league.id}
    assert_redirected_to league_path(open_league.id)
    new_member_count = Member.where(["league_id = ?", open_league.id]).count
    assert_equal member_count + 1, new_member_count
  end

  test "join league but already member" do
    open_league = leagues(:alien)
    member_count = Member.where(["league_id = ?", open_league.id]).count
    authenticate(users(:user001).email, 'password')
    get :join, {'id' => open_league.id}
    assert_redirected_to league_path(open_league.id)
    new_member_count = Member.where(["league_id = ?", open_league.id]).count
    assert_equal member_count, new_member_count
  end

  test "join approval required league" do
    approval_league = leagues(:alien)
    member_count = Member.where(["league_id = ?", approval_league.id]).count
    authenticate(users(:lonelyuser).email, 'password')
    get :join, {'id' => approval_league.id}
    assert_redirected_to new_request_path << \
      "?league_id=#{approval_league.id}&request_type=join_league"
    new_member_count = Member.where(["league_id = ?", approval_league.id]).count
    assert_equal member_count, new_member_count
  end

  def create_events(base_time, season, number, interval_in_days)
    interval = interval_in_days
    counter = interval
    ActiveRecord::Base.transaction do
      (1..number).each do |i|
        event = Event.new(:time => base_time + counter, :name => "Event #{i}",
          :season => season, :track => tracks(:monza))
        counter += interval
        event.save
      end
    end
  end

  test "recent events" do
    season = Season.new(:league => leagues(:alien), :name => "whatever")
    season.save
    base_time = DateTime.now
    create_events(base_time, season, 10, -1)

    recent_events = @controller.list_recent_events(season, 2)
    assert_equal 2, recent_events.length
    assert recent_events[0].time > recent_events[1].time
    assert_equal (base_time - 1).to_i, recent_events[0].time.to_i
    assert_equal (base_time - 2).to_i, recent_events[1].time.to_i
  end

  test "upcoming events" do
    season = Season.new(:league => leagues(:alien), :name => "whatever")
    season.save
    base_time = DateTime.now
    create_events(base_time, season, 10, 1)
    assert_equal 10, Event.where(["season_id = ?", season.id]).length

    upcoming_events = @controller.list_upcoming_events(season, 2)
    assert_equal 2, upcoming_events.length
    assert upcoming_events[0].time < upcoming_events[1].time
    assert_equal (base_time + 1).to_i, upcoming_events[0].time.to_i
    assert_equal (base_time + 2).to_i, upcoming_events[1].time.to_i
  end

end
