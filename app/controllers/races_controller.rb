class RacesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /races
  # GET /races.xml
  def index
    @races = Race.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @races }
    end
  end

  # GET /races/1
  # GET /races/1.xml
  def show
    @race = Race.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @race }
    end
  end

  # Become the race host:
  def host
    @race = Race.find(params[:id])
    return if not require_perm('host_race', @race.event.season.league.id)

    if not @race.host.nil?
      redirect_to(@race, :alert => "Race already has a host.")
      return
    end

    user = get_current_user
    @race.host = user

    if @race.save
      # TODO: enable these emails, one for each user
      #EventMailer.event_scheduled(User.find(1), @race.event, @race).deliver
      redirect_to :back, :notice => "Thank you for hosting!"
    else
      logger.error("Error assigning user #{user.id} as race host:")
      logger.error(@race.errors)
      redirect_to :back, :alert => "Error assigning you as the race host."
    end
  end

end
