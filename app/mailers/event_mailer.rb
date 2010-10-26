class EventMailer < ActionMailer::Base
  default :from => "webmaster@example.com"

  def event_scheduled(user, event, race)
    @user = user
    @event = event
    @league = event.season.league
    @race = race
    mail(:to => 'dgoodwin@rm-rf.ca', :subject => "Event Scheduled")
  end

  def event_modified(user, event, race)
    @user = user
    @event = event
    @league = event.season.league
    @race = race
    mail(:to => 'dgoodwin@rm-rf.ca', :subject => "Event Modified")
  end

end
