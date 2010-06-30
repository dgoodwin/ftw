class League < ActiveRecord::Base
  has_many :members, :dependent => :destroy
  has_many :users, :through => :members
  has_many :seasons, :dependent => :destroy
  # TODO: unique name
end
