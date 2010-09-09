class Game < ActiveRecord::Base
  belongs_to :platform
  has_many :leagues
  has_many :tracks

  validates_presence_of :key, :name
  validates_uniqueness_of :key, :name
end
