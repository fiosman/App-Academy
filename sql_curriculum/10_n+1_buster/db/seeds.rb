# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
artists = Artist.create([
  { name: 'Beyonce' },
  { name: 'Nicki Minaj' },
  { name: 'Ciara' }
])

beyonce_albums = Album.create([
  { title: 'Lemonade', artist_id: artists.first.id },
  { title: 'I Am... Sasha Fierce', artist_id: artists.first.id },
  { title: 'Dangerously in Love', artist_id: artists.first.id },
  { title: 'B\'Day', artist_id: artists.first.id },
  { title: '4', artist_id: artists.first.id }
])

nicki_albums = Album.create([
  { title: 'The Pinkprint', artist_id: artists.second.id },
  { title: 'Pink Friday', artist_id: artists.second.id },
  { title: 'Fake Album 1', artist_id: artists.second.id },
  { title: 'Fake Album 2', artist_id: artists.second.id }
])

ciara_albums = Album.create([
  { title: 'Goodies', artist_id: artists.third.id },
  { title: 'Ciara', artist_id: artists.third.id },
  { title: 'Fake Album 3', artist_id: artists.third.id },
  { title: 'Fake Album 4', artist_id: artists.third.id },
  { title: 'Fake Album 5', artist_id: artists.third.id },
  { title: 'Fake Album 6', artist_id: artists.third.id },
  { title: 'Fake Album 7', artist_id: artists.third.id }
])

beyonce_tracks = Track.create([
  { title: 'Sorry', album_id: beyonce_albums.first.id },
  { title: 'Pray You Catch Me', album_id: beyonce_albums.first.id },
  { title: 'Don\'t Hurt Yourself', album_id: beyonce_albums.first.id },
  { title: '6 Inch', album_id: beyonce_albums.first.id },
  { title: 'Daddy Lessons', album_id: beyonce_albums.first.id },
  { title: 'Love Drought', album_id: beyonce_albums.first.id },
  { title: 'Freedom', album_id: beyonce_albums.first.id },
  { title: 'Formation', album_id: beyonce_albums.first.id },
  { title: 'Halo', album_id: beyonce_albums.second.id },
  { title: 'Video Phone', album_id: beyonce_albums.second.id },
  { title: 'If I Were A Boy', album_id: beyonce_albums.second.id },
  { title: 'Disappear', album_id: beyonce_albums.second.id },
  { title: 'Satellites', album_id: beyonce_albums.second.id },
  { title: 'Diva', album_id: beyonce_albums.second.id },
  { title: 'Baby Boy', album_id: beyonce_albums.third.id },
  { title: 'Be with You', album_id: beyonce_albums.third.id },
  { title: 'Yes', album_id: beyonce_albums.third.id },
  { title: 'Ring the Alarm', album_id: beyonce_albums.fourth.id },
  { title: 'Green Light', album_id: beyonce_albums.fourth.id },
  { title: 'Irreplaceable', album_id: beyonce_albums.fourth.id },
  { title: 'Resentment', album_id: beyonce_albums.fourth.id },
  { title: 'Party', album_id: beyonce_albums.fifth.id }
])

nicki_tracks = Track.create([
  { title: 'Only', album_id: nicki_albums.first.id },
  { title: 'Feeling Myself', album_id: nicki_albums.first.id },
  { title: 'Want Some More', album_id: nicki_albums.first.id },
  { title: 'Buy A Heart', album_id: nicki_albums.first.id },
  { title: 'Win Again', album_id: nicki_albums.first.id },
  { title: 'Grand Piano', album_id: nicki_albums.first.id },
  { title: 'Favorite', album_id: nicki_albums.first.id },
  { title: 'Fly', album_id: nicki_albums.second.id },
  { title: 'Your Love', album_id: nicki_albums.second.id },
  { title: 'Dear Old Nicki', album_id: nicki_albums.second.id },
  { title: 'I\'m the Best', album_id: nicki_albums.second.id },
  { title: 'Last Chance', album_id: nicki_albums.second.id },
  { title: 'Here I Am', album_id: nicki_albums.second.id },
  { title: 'Fake Track 1', album_id: nicki_albums.third.id },
  { title: 'Fake Track 2', album_id: nicki_albums.third.id },
  { title: 'Fake Track 3', album_id: nicki_albums.third.id },
  { title: 'Fake Track 4', album_id: nicki_albums.third.id },
  { title: 'Fake Track 5', album_id: nicki_albums.fourth.id },
  { title: 'Fake Track 6', album_id: nicki_albums.fourth.id },
  { title: 'Fake Track 7', album_id: nicki_albums.fourth.id }
])

ciara_tracks = Track.create([
  { title: '1, 2 Step', album_id: ciara_albums.first.id },
  { title: 'Pick Up the Phone', album_id: ciara_albums.first.id },
  { title: 'Ooh Baby', album_id: ciara_albums.first.id },
  { title: 'Goodies', album_id: ciara_albums.first.id },
  { title: 'And I', album_id: ciara_albums.first.id },
  { title: 'Hotline', album_id: ciara_albums.first.id },
  { title: 'I\'m Out', album_id: ciara_albums.second.id },
  { title: 'Sophomore', album_id: ciara_albums.second.id },
  { title: 'Keep On Lookin', album_id: ciara_albums.second.id },
  { title: 'Livin\' It Up', album_id: ciara_albums.second.id },
  { title: 'Read My Lips', album_id: ciara_albums.second.id },
  { title: 'Fake Track 8', album_id: ciara_albums.third.id },
  { title: 'Fake Track 9', album_id: ciara_albums.third.id },
  { title: 'Fake Track 10', album_id: ciara_albums.third.id },
  { title: 'Fake Track 11', album_id: ciara_albums.third.id },
  { title: 'Fake Track 12', album_id: ciara_albums.third.id },
  { title: 'Fake Track 13', album_id: ciara_albums.fourth.id },
  { title: 'Fake Track 14', album_id: ciara_albums.fourth.id },
  { title: 'Fake Track 15', album_id: ciara_albums.fourth.id },
  { title: 'Fake Track 16', album_id: ciara_albums.fourth.id }
])

houses = House.create([
  { address: '10th and Madison' },
  { address: 'Hopkins House' },
  { address: '2990 Mission St' },
  { address: '1458 11th Ave' }
])

gardeners = Gardener.create([
  { name: 'Molly', house_id: houses.first.id },
  { name: 'Scott', house_id: houses.first.id },
  { name: 'Noemi', house_id: houses.second.id },
  { name: 'Arthur', house_id: houses.third.id },
  { name: 'Fred', house_id: houses.fourth.id },
  { name: 'Sandy', house_id: houses.fourth.id }
])

plants = Plant.create([
  { species: 'Maple Ash', gardener_id: gardeners[0].id },
  { species: 'Sweet Woodruff', gardener_id: gardeners[0].id },
  { species: 'Dandelion', gardener_id: gardeners[0].id },
  { species: 'Red Rose', gardener_id: gardeners[0].id },
  { species: 'Huckleberry', gardener_id: gardeners[1].id },
  { species: 'Flowering Dogwood', gardener_id: gardeners[1].id },
  { species: 'Lily', gardener_id: gardeners[1].id },
  { species: 'Snapdragon', gardener_id: gardeners[1].id },
  { species: 'Golden Barrel', gardener_id: gardeners[1].id },
  { species: 'Penny Hedge', gardener_id: gardeners[2].id },
  { species: 'Pregnant Onion', gardener_id: gardeners[2].id },
  { species: 'Moss', gardener_id: gardeners[2].id },
  { species: 'Parlor Palm', gardener_id: gardeners[2].id },
  { species: 'Sunflower', gardener_id: gardeners[2].id },
  { species: 'Yellow Fieldcress', gardener_id: gardeners[3].id },
  { species: 'Lamb\'s Ear', gardener_id: gardeners[3].id },
  { species: 'Yellow Fieldcress', gardener_id: gardeners[3].id },
  { species: 'Brown-eyed Susan', gardener_id: gardeners[3].id },
  { species: 'Collard', gardener_id: gardeners[4].id },
  { species: 'Purple Kale', gardener_id: gardeners[4].id },
  { species: 'Strawberries', gardener_id: gardeners[4].id },
  { species: 'Basil', gardener_id: gardeners[4].id },
  { species: 'Fennel', gardener_id: gardeners[4].id },
  { species: 'Rosemary', gardener_id: gardeners[5].id },
  { species: 'Chrysanthemum', gardener_id: gardeners[5].id },
  { species: 'Orchid', gardener_id: gardeners[5].id },
  { species: 'Daisy', gardener_id: gardeners[5].id },
  { species: 'Bird of Paradise', gardener_id: gardeners[5].id },
  { species: 'Green Cottonwood', gardener_id: gardeners[5].id }
])

12.times do |plant_id|
  10.times do
    count = rand(1..50)
    Seed.create(count: count, plant_id: plant_id)
  end
end

routes = Route.create([
  { number: 48 },
  { number: 24 },
  { number: 49 },
  { number: 28 },
  { number: 10 }
])

buses = Bus.create([
  { model: 'VW', route_id: routes.first.id },
  { model: 'MK', route_id: routes.first.id },
  { model: 'JN', route_id: routes.first.id },
  { model: 'PL', route_id: routes.first.id },
  { model: 'EB', route_id: routes.first.id },
  { model: 'MiniTour', route_id: routes.second.id },
  { model: 'MiniRack', route_id: routes.second.id },
  { model: 'MiniMagic', route_id: routes.second.id },
  { model: 'MiniBus', route_id: routes.second.id },
  { model: 'MiniVan', route_id: routes.second.id },
  { model: 'MiniSup', route_id: routes.second.id },
  { model: 'Paragon', route_id: routes.third.id },
  { model: 'Aero Town', route_id: routes.third.id },
  { model: 'Wonder', route_id: routes.third.id },
  { model: 'Break Speed', route_id: routes.third.id },
  { model: 'Spectra', route_id: routes.third.id },
  { model: 'A', route_id: routes.fourth.id },
  { model: 'B', route_id: routes.fourth.id },
  { model: 'C', route_id: routes.fourth.id },
  { model: 'D', route_id: routes.fourth.id },
  { model: 'E', route_id: routes.fourth.id },
  { model: 'F', route_id: routes.fourth.id },
  { model: 'G', route_id: routes.fourth.id },
  { model: 'H', route_id: routes.fourth.id },
  { model: 'Globus', route_id: routes.fifth.id },
  { model: 'Versa', route_id: routes.fifth.id },
  { model: 'Magic', route_id: routes.fifth.id },
  { model: 'Avada', route_id: routes.fifth.id },
  { model: 'Elm', route_id: routes.fifth.id },
  { model: 'Wicker', route_id: routes.fifth.id },
  { model: 'Rapid', route_id: routes.fifth.id }
])

drivers = Driver.create([
  { name: 'Joan Lee', bus_id: buses[0].id },
  { name: 'Charlie McDonald', bus_id: buses[0].id },
  { name: 'Kevin Quashie', bus_id: buses[0].id },
  { name: 'Michael Wallace', bus_id: buses[0].id },
  { name: 'Mia Mingus', bus_id: buses[0].id },
  { name: 'Ed Michaels', bus_id: buses[1].id },
  { name: 'Lisa Frank', bus_id: buses[1].id },
  { name: 'Willy Wonka', bus_id: buses[1].id },
  { name: 'Rihanna', bus_id: buses[1].id },
  { name: 'Sharla Alegria', bus_id: buses[1].id },
  { name: 'Roger Sanders', bus_id: buses[2].id },
  { name: 'Tom Cathy', bus_id: buses[2].id },
  { name: 'Kanye West', bus_id: buses[2].id },
  { name: 'Anderson Paak', bus_id: buses[2].id },
  { name: 'Sarah Shahi', bus_id: buses[2].id },
  { name: 'Tom Cathy', bus_id: buses[2].id },
  { name: 'Harold Martin', bus_id: buses[3].id },
  { name: 'Willow Smith', bus_id: buses[3].id },
  { name: 'DJ Mustard', bus_id: buses[3].id },
  { name: 'Nia King', bus_id: buses[3].id },
  { name: 'Alice Waters', bus_id: buses[3].id },
  { name: 'Grace Lee Boggs', bus_id: buses[4].id },
  { name: 'Dulce Rivera', bus_id: buses[4].id },
  { name: 'Michel Gerard', bus_id: buses[4].id },
  { name: 'Roger Larson', bus_id: buses[4].id },
  { name: 'Paul Ekman', bus_id: buses[4].id },
  { name: 'Richard Nesbitt', bus_id: buses[4].id },
  { name: 'Michael Li', bus_id: buses[4].id },
  { name: 'Megan West', bus_id: buses[5].id },
  { name: 'Katherine Key', bus_id: buses[5].id },
  { name: 'Alfonso Cuaron', bus_id: buses[5].id },
  { name: 'Emily Gilmore', bus_id: buses[5].id },
  { name: 'Ariana Grande', bus_id: buses[5].id },
  { name: 'Maria Ahmed', bus_id: buses[6].id },
  { name: 'Charlie Simmons', bus_id: buses[6].id },
  { name: 'Rage Newton', bus_id: buses[6].id },
  { name: 'Michael Hooton', bus_id: buses[6].id },
  { name: 'Jett Taylor', bus_id: buses[6].id },
  { name: 'Shaleece Haas', bus_id: buses[6].id }
])
