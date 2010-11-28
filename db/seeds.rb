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
    "Autodromo Nazionale Monza (Weather)",
    "Autodromo Nazionale Monza (No Chicane)",
    "Autumn Ring",
    "Autumn Ring (Reverse)",
    "Autumn Ring Mini",
    "Autumn Ring Mini (Reverse)",
    "Cape Ring",
    "Cape Ring South",
    "Cape Ring North",
    "Cape Ring Inside",
    "Cape Ring Periphery",
    "Chamonix Main",
    "Chamonix Main (Weather)",
    "Chamonix East",
    "Chamonix East (Weather)",
    "Chamonix West",
    "Chamonix West (Weather)",
    "Chamonix Mini",
    "Chamonix Mini (Weather)",
    "Circuit de la Sarthe 2005",
    "Circuit de la Sarthe 2005 (No Chicanes)",
    "Circuit de la Sarthe 2009",
    "Circuit de la Sarthe 2009 (Time / Weather)",
    "Circuit de la Sarthe 2009 (No Chicanes)",
    "Circuito de Madrid",
    "Circuito de Madrid (Reverse)",
    "Circuito de Madrid Mini",
    "Circuito de Madrid Mini (Reverse)",
    "Cote d'Azur",
    "Daytona International Speedway Superspeedway",
    "Daytona International Speedway Road Course",
    "Deep Forest Raceway",
    "Deep Forest Raceway (Reverse)",
    "Eiger Nordwand Road Short Track",
    "Eiger Nordwand Road Short Track (Weather)",
    "Eiger Nordwand Road Short Track (Reverse)",
    "Eiger Nordwand Dirt K-Trail",
    "Eiger Nordwand Dirt K-Trail (Reverse)",
    "Eiger Nordwand Dirt G-Trail",
    "Eiger Nordwand Dirt G-Trail (Reverse)",
    "Eiger Nordwand Dirt W-Trail",
    "Eiger Nordwand Dirt W-Trail (Reverse)",
    "Fuji Speedway F",
    "Fuji Speedway GT",
    "Grand Valley Speedway",
    "Grand Valley Speedway (Reverse)",
    "Grand Valley Speedway East",
    "Grand Valley Speedway East (Reverse)",
    "High Speed Ring",
    "High Speed Ring (Reverse)",
    "High Speed Ring (Weather)",
    "Indianapolis Motor Speedway Superspeedway",
    "Indianapolis Motor Speedway Road Course",
    "Nurburgring Nordschleife",
    "Nurburgring Nordschleife (Time)",
    "Nurburgring 24h Rennen (Time / Weather)",
    "Nurburgring GP/F",
    "Nurburgring GP/D",
    "Nurburgring typeV",
    "Rome Circuit",
    "Rome Circuit (Reverse)",
    "Special Stage Route 5",
    "Special Stage Route 5 (Reverse)",
    "Special Stage Route 5 Clubman Stage R5",
    "Special Stage Route 5 Clubman Stage R5 (Reverse)",
    "Special Stage Route 7",
    "Special Stage Route 7 (Weather)",
    "Suzuka Circuit",
    "Suzuka Circuit (Weather)",
    "Suzuka Circuit East Course",
    "Tokyo Route 246",
    "Tokyo Route 246 (Reverse)",
    "Top Gear Test Track",
    "Toscana",
    "Toscana (Time)",
    "Toscana (Reverse)",
    "Trial Mountain Circuit",
    "Trial Mountain Circuit (Reverse)",
    "Tsukuba Circuit",
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
    "Unrestricted",
    "Comfort: Hard",
    "Comfort: Medium",
    "Comfort: Soft",
    "Sport: Hard",
    "Sport: Medium",
    "Sport: Soft",
    "Racing: Hard",
    "Racing: Medium",
    "Racing: Soft",
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
