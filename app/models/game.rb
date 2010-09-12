class Game < ActiveRecord::Base
  belongs_to :platform
  has_many :leagues
  has_many :tracks
  has_many :weathers
  has_many :tires

  validates_presence_of :key, :name
  validates_uniqueness_of :key, :name
end
