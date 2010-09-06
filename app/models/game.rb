class Game < ActiveRecord::Base
  belongs_to :platform
  has_many :leagues

  validates_presence_of :key, :name
  validates_uniqueness_of :key, :name
end
