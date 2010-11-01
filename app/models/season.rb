class Season < ActiveRecord::Base
  belongs_to :league
  has_many :events, :dependent => :destroy

  # TODO: unique name
  # TODO: must have league
  validates_presence_of :start_date, :end_date, :league
end
