class Event < ActiveRecord::Base
  belongs_to :season
  has_many :races, :dependent => :destroy
  belongs_to :track

  validates_presence_of :name, :message => \
    "Must specify a name for events."

  validates_presence_of :time, \
    :message => "Must specify a race time for event."

  validates_presence_of :season, \
    :message => "Cannot create event without a season."

  validates_presence_of :track, \
    :message => "Cannot create event without track."

end
