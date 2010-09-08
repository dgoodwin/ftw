class Race < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :users
  has_many :race_results
  has_many :host_volunteers
  belongs_to :host, :class_name => 'User'

  validates_presence_of :index, :message => \
    "Race must be given an index."
end
