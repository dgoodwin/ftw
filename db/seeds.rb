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
all = User.all
if all.length == 1
  only_user = all[0]
  if only_user.permissions.nil? or only_user.permissions.length == 0
    only_user.permissions = []
    only_user.permissions << Permission.new(:user => only_user, :role => 'site_admin',
              :qualifier => 0)
  end
end

psn = Platform.new(:key => 'psn', :name => "Playstation Network")
psn.save

gt5 = Game.new(:key => 'gt5', :name => "Gran Turismo 5", :platform => psn)
gt5.save

# Development stuff:

# Create 40 Test Users:
(1..40).each do |i|
  username = "testuser#{i}"
  user = User.new(:email => "#{username}@example.com",
      :name => username, :password => password)
  user.save
end
