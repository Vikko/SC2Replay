# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Map.create :name => "Dessert", :max_players => 2
Map.create :name => "Ocean", :max_players => 3
Map.create :name => "Space", :max_players => 1

Replay.create :title => "Maran en Vikko zijn pro bezig", :map_id => 1, :winning_team => true, :game_type => 2

User.create(:email => "vikko@awesomesc2.com", :password => "ilovesc2", :password_confirmation => "ilovesc2")