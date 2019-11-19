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
p1 = Plane.create :name => 'Burning1', :row => 60, :column => 8
p2 = Plane.create :name => 'Burning2', :row => 26, :column => 6
p3 = Plane.create :name => 'Burning3', :row => 48, :column => 8
p4 = Plane.create :name => 'Burning4', :row => 26, :column => 6

Flight.destroy_all
f1 = Flight.create :number => 'B01', :origin => 'Sydney', :destination => 'Melbourne', :date => '22 Jan 2020'
f2 = Flight.create :number => 'B02', :origin => 'Melbourne', :destination => 'Sydney', :date => '22 Jan 2020'
f3 = Flight.create :number => 'B10', :origin => 'Sydney', :destination => 'Brisbane', :date => '22 Jan 2020'
f4 = Flight.create :number => 'B11', :origin => 'Brisbane', :destination => 'Sydney', :date => '22 Jan 2020'
f5 = Flight.create :number => 'B20', :origin => 'Sydney', :destination => 'Auckland', :date => '22 Jan 2020'
f6 = Flight.create :number => 'B21', :origin => 'Auckland', :destination => 'Sydney', :date => '22 Jan 2020'
f7 = Flight.create :number => 'B22', :origin => 'Melbourne', :destination => 'Auckland', :date => '22 Jan 2020'
f8 = Flight.create :number => 'B23', :origin => 'Auckland', :destination => 'Melbourne', :date => '22 Jan 2020'
f9 = Flight.create :number => 'B12', :origin => 'Brisbane', :destination => 'Melbourne', :date => '22 Jan 2020'
f10 = Flight.create :number => 'B13', :origin => 'Melbourne', :destination => 'Brisbane', :date => '22 Jan 2020'
f11 = Flight.create :number => 'B30', :origin => 'Adelaide', :destination => 'Melbourne', :date => '22 Jan 2020'
f12 = Flight.create :number => 'B31', :origin => 'Melbourne', :destination => 'Adelaide', :date => '22 Jan 2020'

p1.flights << f1 << f2 << f5 << f6
p2.flights << f3 << f4 << f9 << f10
p3.flights << f7 << f8
p4.flights << f11 << f12

Reservation.destroy_all