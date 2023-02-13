# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Airport.create([{name: "SGN"},  {name: "DAD"}, {name: "MEL"}, {name: "HAN"}, {name: "HKG"}])

10.times do
    departure_airport = Airport.offset(rand(Airport.count)).first
    arrival_airport = Airport.offset(rand(Airport.count)).first
    while arrival_airport == departure_airport
        arrival_airport = Airport.offset(rand(Airport.count)).first
    end
    departure_time = Faker::Time.between(from: DateTime.now, to: DateTime.now + 1)
  
    Flight.create(departure_airport: departure_airport,
                  arrival_airport: arrival_airport,
                  departure_time: departure_time,
                  flight_duration: rand(3..12)*60)
end

# Airport.offset(5).destroy_all
# Flight.offset(10).destroy_all