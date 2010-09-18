class Registrant < ActiveRecord::Base
  belongs_to :event
  belongs_to :member

  validates_uniqueness_of :member_id, :scope => :event_id
  validates_presence_of :member, :event
end
