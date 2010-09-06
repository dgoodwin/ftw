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
    else
      user = nil
    end

    @can_join = user && !@member

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @league }
    end
  end

  # GET /leagues/new
  # GET /leagues/new.xml
  def new
    @league = League.new
    return if not require_perm('create_league', @league.id)


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @league }
    end
  end

  # GET /leagues/1/edit
  def edit
    @league = League.find(params[:id])
    return if not require_perm('edit_league', @league.id)
  end

  # POST /leagues
  # POST /leagues.xml
  def create
    @league = League.new(params[:league])
    return if not require_perm('create_league', @league.id)

    creator = get_current_user()
    member = Member.new(:league => @league, :user => creator)
    @league.members << member

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

end
