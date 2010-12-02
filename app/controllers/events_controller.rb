class EventsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /events
  # GET /events.xml
  def index
    @league = League.find(params[:league_id])
    @events = Event.find_by_sql(["SELECT e.* from events e, seasons s where s.league_id = ? and e.season_id = s.id", @league.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    @league = @event.season.league

    user = get_current_user
    member = find_member(user, @event.season.league)

    @registration_message = registration_msg(member, @event)

    @registered = (not find_registrant(member, @event).nil?)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @league = League.find(params[:league_id])
    
    return if not require_perm('create_event', @league.id)
    #
    # TODO: probably should filter on active seasons only?
    @seasons = Season.where(["league_id = ?", @league.id])
    @season = @event.season

    if @seasons.length == 0
      redirect_to :back, :notice => "You must create a season before creating events."
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @season = @event.season
    @league = @season.league
    return if not require_perm('edit_event', @league.id)

    @seasons = Season.where(["league_id = ?", @league.id])
  end

  # POST /events
  # POST /events.xml
  def create
    @league = League.find(params[:league_id])
    @event = Event.new(params[:event])
    return if not require_perm('create_event', @league.id)

    @season = @event.season
    @seasons = Season.where(["league_id = ?", @league.id])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(league_event_path(@league, @event), :notice => 'Event was successfully created.') }
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
    @season = @event.season
    return if not require_perm('edit_event', @event.season.league.id)

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
    league = @event.season.league
    return if not require_perm('destroy_event', league.id)
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(league_events_path(league)) }
      format.xml  { head :ok }
    end
  end

  def schedule
    @event = Event.find(params[:id])
    return if not require_perm('schedule_event', @event.season.league.id)

    if @event.scheduled?
      logger.warn "Attempt to re-schedule an event: %s" % @event.id
      flash[:error] = "Event has already been scheduled."
      redirect_to(@event, :notice => 'Event has already been scheduled.')
      return
    end

    if @event.registrants.length < 2
      redirect_to(@event, :notice => "Must have at least two registrants to schedule.")
      return
    end

    logger.info "Scheduling event %s for league: %s" % \
      [@event.id, @event.season.league.id] 
    # TODO: assuming race size of 16 for now, should be configurable
    race_sizes = calc_race_sizes(@event.registrants.length, 16)
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
      race.password = ""
      races << race
      index += 1
    end

    # Assign users to each race:
    # TODO: assign randomly, or perhaps based on standings?
    race_index = 0
    @event.registrants.each do |registrant|
      member = registrant.member
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

  # Send a reminder email to all event registrants.
  def send_reminder
    @event = Event.find(params[:id])
    return if not require_perm('send_reminder', @event.season.league.id)

    # Block this if any races do not have a host assigned.
    @event.races.each do |race|
      if race.host.nil?
        redirect_to(@event, :notice => "Cannot send reminder email until all races have a host.")
        return
      end
    end

    @event.races.each do |race|
      race.users.each do |user|
        EventMailer.event_reminder(user, @event, race).deliver

      end
    end
    redirect_to(@event, :notice => 'Reminder email has been sent to all registrants.')
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

  # TODO: test code only
  def register_entire_league
    @event = Event.find(params[:id])
    @event.season.league.members.each do |member|
      registrant = Registrant.new(:member => member, :event => @event)
      registrant.save
    end

    redirect_to @event, :notice => "Entire league has been registered for this event."
  end

  def find_member(user, league)
    results = Member.where(["league_id = ? AND user_id = ?", 
      league.id, user.id])
    if results.length == 1
      return results[0]
    end
    return nil
  end

  def find_registrant(member, event)
    results = Registrant.where(["event_id = ? AND member_id = ?", @event.id, member.id])
    if results.length == 1
      return results[0]
    end
    return nil
  end

  def register
    @event = Event.find(params[:id])
    user = get_current_user

    member = find_member(user, @event.season.league)

    @registration_message = registration_msg(member, @event)
    if not @registration_message.nil?
      redirect_to event_path(@event), :notice => @registration_message
      return
    end

    registrant = Registrant.new(:member => member, :event => @event)
    if registrant.save
      redirect_to event_path(@event), :notice => "Successfully registered for event."
    else
      logger.error("Error registering for event")
      logger.error(registrant.errors)
      redirect_to event_path(@event), :notice => "Error registering for event" 
    end
  end

  def registration_msg(member, event)
    if member.nil?
      return "You are not a member of this league."
    elsif not find_registrant(member, @event).nil?
      return "You are registered for this event."
    elsif @event.scheduled?
      return "Cannot register after event has been scheduled."
    else
      return nil
    end
  end

  def unregister
    @event = Event.find(params[:id])
    user = get_current_user
    member = find_member(user, @event.season.league)
    if member.nil?
      redirect_to event_path(@event), :notice => "You are not a member of this league."
      return
    end

    reg = find_registrant(member, @event)
    if reg.nil?
      redirect_to event_path(@event), :notice => "You are not registered for this event."
      return
    end

    if @event.scheduled?
      redirect_to event_path(@event), :notice => "Cannot unregister after event has been scheduled."
      return
    end

    reg.destroy

    redirect_to event_path(@event), :notice => "Successfully un-registered."
  end

end
