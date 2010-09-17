class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :league

  validates_presence_of :time, :user, :request_type
  validates_uniqueness_of :user_id, :scope => [:league_id, :request_type],
    :message => "has already submitted this same request."
end
