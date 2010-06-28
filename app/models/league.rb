class League < ActiveRecord::Base
  has_many :members, :dependent => :destroy
  has_many :users, :through => :members
end
