class Event < ActiveRecord::Base
  belongs_to :season
  has_many :races, :dependent => :destroy
  belongs_to :track
  belongs_to :tire
  belongs_to :weather

  has_many :registrants, :dependent => :destroy
  has_many :users, :through => :registrants

  validates_numericality_of :pp, :greater_than_or_equal_to => 0, :allow_nil => true,
    :message => "Performance points must be 0 or a positive integer."

  validates_presence_of :name, :message => \
    "Must specify a name for events."

  validates_presence_of :time, \
    :message => "Must specify a race time for event."

  validates_presence_of :season, \
    :message => "Cannot create event without a season."

  validates_presence_of :track, \
    :message => "Cannot create event without track."

  validate :within_season_dates

  def within_season_dates
    if time and season and (time < season.start_date or time > season.end_date)
      errors.add(:time, "outside of season's start/end dates.")
    end
  end

  def scheduled?
    return races.length > 0
  end

end
