class League < ActiveRecord::Base
  has_many :members, :dependent => :destroy
  has_many :users, :through => :members
  has_many :seasons, :dependent => :destroy
  belongs_to :game

  validates_uniqueness_of :name, :message => "League name already in use."

  validates_presence_of :name, :message => \
    "Please specify a unique name for your league."

  validates_presence_of :game
end
