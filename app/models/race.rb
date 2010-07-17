class Race < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :users

  validates_presence_of :index, :message => \
    "Race must be given an index."
end
