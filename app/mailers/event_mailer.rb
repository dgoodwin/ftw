class EventMailer < ActionMailer::Base
  # TODO: CONFIG
  default :from => "webmaster@gthub.net"

  def event_reminder(user, event, race)
    @user = user
    @event = event
    @league = event.season.league
    @race = race
    mail(:to => @user.email, :subject => event.season.league.name << ": Event Reminder")
  end

  def event_modified(user, event, race)
    @user = user
    @event = event
    @league = event.season.league
    @race = race
    mail(:to => @user.email, :subject => "Event Modified")
  end

end
