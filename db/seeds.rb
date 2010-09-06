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

