class LeaguesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /leagues
  # GET /leagues.xml
  def index
    @leagues = League.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leagues }
    end
  end

  # GET /leagues/1
  # GET /leagues/1.xml
  def show
    @league = League.find(params[:id])
    
    # Check if we'll be displaying a "join this league" link.
    if user_signed_in?
      user = get_current_user()
      @member = Member.where(["user_id = ? AND league_id = ?", user.id, @league.id]).first
      @have_account = Account.where(["user_id = ? AND platform_id = ?", user.id,
          @league.game.platform.id]).length > 0
    else
      user = nil
    end

    @can_join = user && !@member

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @league }
    end
  end

  def setup_select_data
    @racing_types = {
      "Sports Cars" => 'sports',
      "Touring Cars" => 'touring',
      "Single Seater" => 'single_seater',
      "Karting" => 'kart',
      "NASCAR" => 'nascar',
      "Crappy Cars" => 'crap',
      "Other" => 'other',
      "Various" => 'various',
    }

    @skill_levels = {
      "Beginner" => 'beginner',
      "Intermedite" => 'intermediate',
      "Advanced" => 'advanced',
      "Alien" => 'alien',
    }

    @membership_types = {
      "Approval Required" => 'approval',
      "Open (all can join)" => 'open',
#      "Invite Only" => 'invite',
#      "Closed" => 'closed',
    }
  end

  # GET /leagues/new
  # GET /leagues/new.xml
  def new
    @league = League.new
    return if not require_perm('create_league', @league.id)
    
    setup_select_data

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @league }
    end
  end

  # GET /leagues/1/edit
  def edit
    @league = League.find(params[:id])
    return if not require_perm('edit_league', @league.id)
    setup_select_data
  end

  # POST /leagues
  # POST /leagues.xml
  def create
    @league = League.new(params[:league])
    return if not require_perm('create_league', @league.id)

    creator = get_current_user()
     member = Member.new(:league => @league, :user => creator, 
           :account => creator.get_account(@league.game.platform))
     @league.members << member

#     # TODO: Development only code below, join all site users to every new league:
#     User.all.each do |user|
#       member = Member.new(:league => @league, :user => user, 
#            :account => user.get_account(@league.game.platform))
#       @league.members << member
#     end

    respond_to do |format|
      if @league.save 

        # Once saved, grant the league admin role to creating user:
        creator.permissions << Permission.new(:user => creator, 
            :role => 'league_admin', :qualifier => @league.id)

        # Check again:
        if @league.save
          format.html { redirect_to(@league, :notice => 'League was successfully created.') }
          format.xml  { render :xml => @league, :status => :created, :location => @league }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @league.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @league.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leagues/1
  # PUT /leagues/1.xml
  def update
    @league = League.find(params[:id])
    return if not require_perm('edit_league', @league.id)

    respond_to do |format|
      if @league.update_attributes(params[:league])
        format.html { redirect_to(@league, :notice => 'League was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @league.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.xml
  def destroy
    @league = League.find(params[:id])
    return if not require_perm('destroy_league', @league.id)
    @league.destroy

    respond_to do |format|
      format.html { redirect_to(leagues_url) }
      format.xml  { head :ok }
    end
  end

  # Render the administration page:
  def admin
    @league = League.find(params[:id])
    # Assume edit_league = league admin:
    return if not require_perm('edit_league', @league.id)

    @join_requests = Request.where(["league_id = ? AND request_type = 'join_league'",
      @league.id])
  end

  # Action to handle requests to join this league.
  def join
    @league = League.find(params[:id])

    if Member.where(["user_id = ? AND league_id = ?", get_current_user().id, @league.id]).first
      redirect_to league_path(@league), :notice => 'You are already a member of this league.'
    elsif @league.membership == "approval"
      redirect_to(new_request_path(:league_id => @league.id, :request_type => 'join_league'))
    elsif @league.membership == "open"
      member = Member.new(:league => @league, :user => get_current_user, :account => get_current_user().get_account(@league.game.platform))
      member.save
      redirect_to league_path(@league), :notice => 'Joined league.'
    end
  end

  # TODO: test code only, kill this someday
  def join_test_users
    @league = League.find(params[:id])
    return if not require_perm('edit_league', params[:id])

    (1..50).each do |i|
      username = "testuser#{i}"
      user = User.where(['name = ?', username])
      if user.length > 0
        user = user[0]
      else
        user = create_test_user(username)
      end

      member = Member.new(:league => @league, :user => user, 
        :account => user.get_account(@league.game.platform))
      member.save
    end

    redirect_to :back, :notice => "50 test users have joined your league."
  end

  def create_test_user(username)

    user = User.new(:email => "#{username}@example.com",
      :name => username, :password => 'password')
    user.accounts << Account.new(:name => username, 
      :platform => Platform.where(["key = 'psn'"])[0]) 
    user.save
    pp user.errors
    return user
  end

end
