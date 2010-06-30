class Season < ActiveRecord::Base
  belongs_to :league

  # TODO: unique name
  # TODO: must have league
end
