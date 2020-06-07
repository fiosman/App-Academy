# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john = Guest.create!(name: 'John Smith', age: 45, favorite_color: 'Blue')
jane = Guest.create!(name: 'Jane Doe', age: 47, favorite_color: 'Green')
josh = Guest.create!(name: 'Josh Brown', age: 22, favorite_color: 'Brown')
helen = Guest.create!(name: 'Helen White', age: 25, favorite_color: 'White')
job = Guest.create!(name: 'Job Bluth', age: 41, favorite_color: 'Red')

Gift.create!(title: 'A Bottle of Wine',
             description: 'This one is not so great.',
             guest: john)
Gift.create!(title: 'Another Bottle of Wine',
             description: 'This one is not so bad.',
             guest: john)
Gift.create!(title: 'The Hunger Games',
             description: 'A bit dark for a gift, but it\'s good.',
             guest: jane)
Gift.create!(title: 'Baseball Glove',
             description: 'Feel like a kid again!',
             guest: josh)
Gift.create!(title: 'Basketball Tickets',
             description: 'The team\'s going 82-0 this year.',
             guest: josh)
Gift.create!(title: 'Hawaiian Getaway',
             description: 'Helen has the best gifts.',
             guest: helen)

sse = Party.create!(name: 'Secret Santa Extravaganza', location: 'Portland')
ccp = Party.create!(name: 'Charles\' Christmas Party', location: 'San Francisco')

Invitation.create!(guest: john, party: sse)
Invitation.create!(guest: jane, party: sse)
Invitation.create!(guest: josh, party: sse)
Invitation.create!(guest: helen, party: sse)
Invitation.create!(guest: job, party: sse)
Invitation.create!(guest: josh, party: ccp)
Invitation.create!(guest: helen, party: ccp)
