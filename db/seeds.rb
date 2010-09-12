# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

# Grant side-admin role if seeding and only one user exists with no perms:
require 'pp'

psn = Platform.new(:key => 'psn', :name => "Playstation Network")
psn.save

gt5 = Game.new(:key => 'gt5', :name => "Gran Turismo 5", :platform => psn)
gt5.save

# Development stuff:

gt5_tracks = [
    "Autodromo Nazionale Monza",
    "Circuit de la Sarthe",
    "Daytona International Speedway",
    "Eiger Nordwand",
    "Fuji Speedway",
    "High Speed Ring",
    "Indianapolis Motor Speedway",
    "Nurburgring",
    "Suzuka Circuit",
    "Top Gear Test Track",
    "Tsukuba Circuit",
    "Daytona International Superspeedway",
    "Indianapolis Superspeedway",
    "Circuito de Madrid",
    "London",
    "Piazza del Campo",
    "Rome",
    "Route 5",
    "Tokyo Route 246",
    "Toscana",
]

gt5_tracks.each do |name|
  track = Track.new(:name => name)
  gt5.tracks << track
end

gt5.save

gt5_weather = [
    "Clear",
    "Rain",
    "Snow",
    "Random"
]
gt5_weather.each do |weather|
  w = Weather.new(:name => weather, :game_id => gt5)
  if not w.save
    pp "Error creating weather: #{weather} (#{w.errors})"
  else
    pp "Created weather: #{weather}"
  end
end

gt5_tires = [
    "Any",
    "N1",
    "N2",
    "N3",
    "S1",
    "S2",
    "S3",
    "R1",
    "R2",
    "R3",
    "Dirt",
    "Snow",
]
gt5_tires.each do |tire|
  t = Tire.new(:name => tire, :game_id => gt5)
  if not t.save
    pp "Error creating tire: #{tire} (#{t.errors})"
  else
    pp "Created tire: #{tire}"
  end
end
