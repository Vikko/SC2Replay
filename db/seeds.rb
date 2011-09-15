# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:username => "Vikko", :email => "vikko@awesomesc2.com", :password => "password", :password_confirmation => "password")
User.create(:username => "Maran", :email => "maran.hidskes@gmail.com", :password => "ilovesc2", :password_confirmation => "ilovesc2")