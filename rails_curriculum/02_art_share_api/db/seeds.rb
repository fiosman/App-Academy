# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'Megan')
User.create!(username: 'Fares')
User.create!(username: 'Andrew')
User.create!(username: 'Chris')

Artwork.create!(title: 'Mona Lisa', image_url: 'tinyurl.com/mona_lisa', artist_id: 2)
Artwork.create!(title: 'Red Mars', image_url: 'imgur.com/red_mars', artist_id: 2)
Artwork.create!(title: 'Earth', image_url: 'imgur.com/earth', artist_id: 1)
Artwork.create!(title: 'Flying Cars', image_url: 'tinyurl.com/flying_cars', artist_id: 3)
Artwork.create!(title: 'Houses', image_url: 'imgur.com/houses', artist_id: 4)

ArtworkShare.create!()


