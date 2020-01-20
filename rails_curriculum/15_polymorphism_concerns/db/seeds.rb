# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Corgi.create(name: Faker::Name.first_name)
  Cat.create(name: Faker::Name.first_name)
end

40.times do
  Toy.create(name: Faker::Superhero.name, toyable_id: rand(1..11), toyable_type: ['Corgi', 'Cat'].sample)
end
