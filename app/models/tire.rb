class Tire < ActiveRecord::Base
  belongs_to :game

  validates_presence_of :name, :game
  validates_uniqueness_of :name, :scope => :game_id
end
