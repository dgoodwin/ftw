class RaceResultRow < ActiveRecord::Base
  belongs_to :user
  belongs_to :race_result
end
