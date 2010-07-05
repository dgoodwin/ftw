class Season < ActiveRecord::Base
  belongs_to :league
  has_many :rounds, :dependent => :destroy

  # TODO: unique name
  # TODO: must have league
end
