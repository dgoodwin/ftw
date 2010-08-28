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
  'destroy_user',
]

RIGHTS.each do |right|
  Right.create(:key => right)
end
