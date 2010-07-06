class Race < ActiveRecord::Base
  belongs_to :round
  has_and_belongs_to_many :users
end
