# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

RIGHTS = [
  'create_league',
  'destroy_league',
  'edit_league',
  'create_season',
  'edit_season',
  'destroy_season',
  'create_event',
  'destroy_event',
  'edit_event',
  'schedule_event',
  'create_results',
  'destroy_results',
  'edit_results',
  'approve_results',
  'edit_user',
  'destroy_user',
]

RIGHTS.each do |right|
  Right.create(:key => right)
end

# Create the standard Roles:
user_role = Role.new(:key => "user", :name => "Regular Joe")
user_role.rights << Right.where(:key => 'create_league')[0]
user_role.rights << Right.where(:key => 'edit_user')[0]
user_role.save

league_admin_role = Role.new(:key => "league_admin", :name => "League Admin")
[ 'edit_league', 'destroy_league', 'create_season', 'edit_season', 
  'destroy_season', 'create_event', 'edit_event', 'destroy_event', 
  'schedule_event', 'create_results', 'destroy_results', 'edit_results', 
  'approve_results'].each do |right|

  league_admin_role.rights << Right.where(:key => right)[0]

end
league_admin_role.save




