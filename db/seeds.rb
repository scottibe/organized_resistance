# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 
50.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    password_digest: Faker::Internet.password,
    name: Faker::Name.first_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    party_affiliation: Faker::GameOfThrones.character
    ) 
end
     
50.times do 
  Event.create(
    title: Faker::StarWars.character,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.forward(30),
    time: Faker::Number.between(1, 12),
    location_name: Faker::StarWars.planet
    )
end 
