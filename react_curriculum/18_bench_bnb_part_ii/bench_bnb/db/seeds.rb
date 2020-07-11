# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = Bench.create!([
  { description: 'This is the first bench', lat: 37.747526, lng: -122.438818 }, 
  { description: 'This is the second bench', lat: 37.747124, lng: -122.443920 }, 
  { description: 'This is the third bench', lat: 37.740506, lng: -122.434986 }
])