class EventsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  # GET /events
  # GET /events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @season = Season.find(params[:season_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @season = Season.find(params[:season_id])
    @event = @season.events.create(params[:event])

    # For now, we auto-assign the event name "Round X", where X is the
    # number of existing events in this season + 1.
    @event.name = "Round %s" % (Event.where(["season_id = ?", @season.id]).length + 1).to_s

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    # TODO: block updates if the event is scheduled
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end

  def schedule
    @event = Event.find(params[:id])
    if @event.races.length > 0
      logger.warn "Attempt to re-schedule an event: %s" % @event.id
      flash[:error] = "Event has already been scheduled."
      redirect_to(@event, :notice => 'Event has already been scheduled.')
      return
    end

    # TODO: Block scheduling if only one participant

    logger.info "Scheduling event %s for league: %s" % \
      [@event.id, @event.season.league.id] 
    # TODO: assuming race size of 16 for now, should be configurable
    race_sizes = calc_race_sizes(@event.season.league.members.length, 16)
    logger.debug("Creating %s races" % race_sizes.length)
    logger.debug(race_sizes)

    # Create all the required races, we'll add participants after:
    races = []
    index = 1 # We manually order each race with an index.
    race_sizes.each do |size|
      race = Race.new
      race.event = @event
      race.time = @event.time
      race.index = index
      race.instructions = ""
      race.password = ""
      races << race
      index += 1
    end

    # Assign users to each race:
    # TODO: assign randomly, or perhaps based on standings?
    race_index = 0
    @event.season.league.members.each do |member|
      races[race_index].users << member.user
      if races[race_index].users.length == race_sizes[race_index]
        race_index += 1
      end
    end

    # Save each race:
    races.each do |race|
      race.save
      @event.races << race
    end

    redirect_to(@event, :notice => 'Races have been scheduled.')
  end

  # Calculate how many races to create and of what size.
  # Attempts to find the minimum number of races to accomodate everyone, but
  # keep the number of participants in each race as close as possible.
  def calc_race_sizes(member_count, max_size)
    race_sizes = []
    events = member_count / max_size
    if member_count % max_size > 0
      events += 1
    end
    
    f = member_count.to_f
    base_size = (f / events).floor
    logger.debug("base_size = %s" % base_size)
    race_sizes = Array.new(events, base_size)
    remainder = member_count - base_size * race_sizes.length
    logger.debug("remainder = %s" % remainder)
    i = 0
    while remainder > 0
      race_sizes[i] += 1
      i += 1
      remainder -= 1
    end
    
    return race_sizes
  end
end
