require 'scoring'

class SeasonsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /seasons
  # GET /seasons.xml
  def index
    @league = League.find(params[:league_id])
    @seasons = @league.seasons

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seasons }
    end
  end

  # GET /seasons/1
  # GET /seasons/1.xml
  def show
    @season = Season.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @season }
    end
  end

  # GET /seasons/new
  # GET /seasons/new.xml
  def new
    @season = Season.new

    # TODO: make sure we have a league ID here, the user has admin rights 
    # within it, etc.
    @league = League.find(params[:league_id])
    return if not require_perm('create_season', @league.id)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @season }
    end
  end

  # GET /seasons/1/edit
  def edit
    @season = Season.find(params[:id])
    @league = @season.league
    return if not require_perm('edit_season', @league.id)
    pp @season
  end

  # POST /seasons
  # POST /seasons.xml
  def create
    @league = League.find(params[:league_id])
    return if not require_perm('create_season', @league.id)

    @season = @league.seasons.create(params[:season])

    respond_to do |format|
      if @season.save
        format.html { redirect_to(league_seasons_path(@season.league), :notice => "Season successfully created: #{@season.name}") }
        format.xml  { render :xml => @season, :status => :created, :location => @season }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @season.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seasons/1
  # PUT /seasons/1.xml
  def update
    @season = Season.find(params[:id])
    return if not require_perm('edit_season', @season.league.id)

    respond_to do |format|
      if @season.update_attributes(params[:season])
        format.html { redirect_to(league_seasons_path(@season.league), :notice => 'Season was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @season.errors, :status => :unprocessable_entity }
      end
    end
  end

  # TODO: Could probably use some optimization, would prefer a single query
  # but it's a bit complicated.
  def load_results_for_season(season)
    results = []
    season.events.each do |event|
      event.races.each do |race|
        race.race_results.each do |result|
          results << result
        end
      end
    end
    return results
  end

  def leaderboard
    @season = Season.find(params[:id])
    @leaderboard = Leaderboard.new()
#     results = RaceResult.find_by_sql ["SELECT result.id, race.id from " + 
#       "race_results result, races race, events e WHERE result.race_id " +
#       "= race.id AND race.event_id = e.id AND e.season_id = ?", @season.id]
    results = load_results_for_season(@season)
    @leaderboard.process(results)
  end

  # DELETE /seasons/1
  # DELETE /seasons/1.xml
  def destroy
    @season = Season.find(params[:id])
    @season.destroy
    return if not require_perm('destroy_season', @season.league.id)

    respond_to do |format|
      format.html { redirect_to(league_seasons_url(@season.league)) }
      format.xml  { head :ok }
    end
  end
end
