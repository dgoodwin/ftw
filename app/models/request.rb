class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :league

  validates_presence_of :time, :user, :request_type
end
