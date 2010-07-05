class RoundsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  # GET /rounds
  # GET /rounds.xml
  def index
    @rounds = Round.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rounds }
    end
  end

  # GET /rounds/1
  # GET /rounds/1.xml
  def show
    @round = Round.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @round }
    end
  end

  # GET /rounds/new
  # GET /rounds/new.xml
  def new
    @round = Round.new
    @season = Season.find(params[:season_id])
    @round.season = @season

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @round }
    end
  end

  # GET /rounds/1/edit
  def edit
    @round = Round.find(params[:id])
  end

  # POST /rounds
  # POST /rounds.xml
  def create
    @season = Season.find(params[:season_id])
    @round = @season.rounds.create(params[:round])

    respond_to do |format|
      if @round.save
        format.html { redirect_to(@round, :notice => 'Round was successfully created.') }
        format.xml  { render :xml => @round, :status => :created, :location => @round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rounds/1
  # PUT /rounds/1.xml
  def update
    # TODO: block updates if the round is scheduled
    @round = Round.find(params[:id])

    respond_to do |format|
      if @round.update_attributes(params[:round])
        format.html { redirect_to(@round, :notice => 'Round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.xml
  def destroy
    @round = Round.find(params[:id])
    @round.destroy

    respond_to do |format|
      format.html { redirect_to(rounds_url) }
      format.xml  { head :ok }
    end
  end

  def schedule
    @round = Round.find(params[:id])
    logger.info "Scheduling round %s for league: %s" % \
      [@round.id, @round.season.league.id] 
    print @round.season.league.name
    print "\n"
    redirect_to(@round, :notice => 'Races have been scheduled.')
  end

  # Calculate how many races to create and of what size.
  # Attempts to find the minimum number of races to accomodate everyone, but
  # keep the number of participants in each race as close as possible.
  def calc_race_sizes(member_count, max_size)
    race_sizes = []
    rounds = member_count / max_size
    if member_count % max_size > 0
      rounds += 1
    end
    
    f = member_count.to_f
    base_size = (f / rounds).floor
    race_sizes = Array.new(rounds, base_size)
    remainder = member_count % base_size
    i = 0
    while remainder > 0
      race_sizes[i] += 1
      i += 1
      remainder -= 1
    end
    
    return race_sizes
  end
end
