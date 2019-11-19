# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create :name => 'Admin', :email => 'admin@ga.com', :admin => true
u2 = User.create :name => 'Chris', :email => 'chris@ga.com'

Plane.destroy_all
p1 = Plane.create :name => 'Burning1', :row => 26, :column => 6
p1 = Plane.create :name => 'Burning2', :row => 26, :column => 6
p1 = Plane.create :name => 'Burning3', :row => 48, :column => 8
p1 = Plane.create :name => 'Burning4', :row => 48, :column => 8
p1 = Plane.create :name => 'Burning5', :row => 60, :column => 8