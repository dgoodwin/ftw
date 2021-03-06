class RaceResultsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :check_user, :only => [:edit, :update]
  
  STATUSES = [
    ['Finished', 'finished'],
    ['No Show', 'no_show'],
    ['Disqualified', 'disqualified']
  ]

  # Check that the current user matches the race result being modified:
  # TODO: replace this when there's a proper permissions system in play
  def check_user
    user = get_current_user
    # Edit/update should have set this param:
    result = RaceResult.find(params[:id])
    if user == result.user
      return true
    end
    flash[:error] = "Cannot modify another users results submission."
    redirect_to result 
    return false
  end

  # GET /race_results
  # GET /race_results.xml
  def index
    @race_results = RaceResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @race_results }
    end
  end

  # GET /race_results/1
  # GET /race_results/1.xml
  def show
    @race_result = RaceResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @race_result }
    end
  end

  # GET /race_results/new
  # GET /race_results/new.xml
  def new
    @race = Race.find(params[:race_id])
    @league = @race.event.season.league
    return if not require_perm('create_results', @race.event.season.league.id)
    @race_result = RaceResult.new

    @valid_status = STATUSES
    
    # Create the required race result rows to place every participant.
    (1..@race.users.length).to_a.each do |i|
      @race_result.rows << RaceResultRow.new(:position => i, :user => @race.users[i-1])
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @race_result }
    end
  end

  # GET /race_results/1/edit
  def edit
    @race_result = RaceResult.find(params[:id])
    @race = @race_result.race
    @league = @race.event.season.league
    return if not require_perm('edit_results', @race.event.season.league.id)
    @valid_status = STATUSES
  end

  # POST /race_results
  # POST /race_results.xml
  def create
    @race = Race.find(params[:race_id])
    @league = @race.event.season.league
    return if not require_perm('create_results', @race.event.season.league.id)
    logger.warn params
    @race_result = RaceResult.new(params[:race_result])
    @race_result.race = @race
    @race_result.user = get_current_user()

    @race_result.rows.each do |row|
      if row.status != 'finished'
        row.position = 0
      end
    end

    # Needed if we redirect back:
    @valid_status = STATUSES
    
    respond_to do |format|
      if @race_result.save
        format.html { redirect_to(@race, :notice => 'Race result was successfully created.') }
        format.xml  { render :xml => @race_result, :status => :created, :location => @race_result }
      else
        print @race_result.errors
        format.html { render :action => "new" }
        format.xml  { render :xml => @race_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /race_results/1
  # PUT /race_results/1.xml
  def update
    @race_result = RaceResult.find(params[:id])
    @race = @race_result.race
    return if not require_perm('edit_results', @race.event.season.league.id)

    @race_result.rows.each do |row|
      if row.status != 'finished'
        row.position = 0
      end
    end

    @valid_status = STATUSES

    respond_to do |format|
      if @race_result.update_attributes(params[:race_result])
        format.html { redirect_to(@race, :notice => 'Race result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @race_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /race_results/1
  # DELETE /race_results/1.xml
  def destroy
    @race_result = RaceResult.find(params[:id])
    race = @race_result.race
    return if not require_perm('destroy_results', race.event.season.league.id)
    @race_result.destroy

    respond_to do |format|
      format.html { redirect_to(race_results_url) }
      format.xml  { head :ok }
    end
  end

end
