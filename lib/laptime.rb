module LapTime

  LAPTIME_REGEX = /(^(((\d+):)?(\d+):)?(\d+)(\.(\d+)$)?$)?/

  # Converts a laptime string to an integer representing the total 
  # milliseconds.
  #
  # Somewhat safe to assume the string has already matched the regex by
  # this point.
  def laptime_string_to_int(laptime_str)
    match = laptime_str.match(LAPTIME_REGEX)
    total = 0

    hours = match[4]
    minutes = match[5]
    seconds = match[6]
    millis = match[8]
    
    total += hours.to_i * 60 * 60 * 1000 if hours
    total += minutes.to_i * 60 * 1000 if minutes
    total += seconds.to_i * 1000
    total += millis.to_i if millis

    return total
  end

end
