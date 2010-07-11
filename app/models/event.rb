class Event < ActiveRecord::Base
  belongs_to :season
  has_many :races, :dependent => :destroy
  # TODO: Give it a name

  validates_presence_of :season, \
    :message => "Cannot create event without a season."

  validates_presence_of :time, \
    :message => "Must specify a race time for event."
end
