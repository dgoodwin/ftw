require 'laptime'

class RaceResultRow < ActiveRecord::Base
  include LapTime

  belongs_to :user
  belongs_to :race_result

  validates_format_of :time, :with => LAPTIME_REGEX

  def time=(time_str)
    write_attribute(:time, time_str)

    # Convert the time string into milliseconds and store separately:
  end

end
