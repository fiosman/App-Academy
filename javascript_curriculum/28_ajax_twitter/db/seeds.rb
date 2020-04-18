# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Tweet.destroy_all

CATS = %w(breakfast earl curie markov gizmo kiki sally)

CATS.each do |cat|
  u = User.create!(username: cat, password: "#{cat}#{cat}")
end

MESSAGES = [
  'Ate some tuna',
  'Chased a string',
  'Bounced a ball',
  'Took a photo of a sandwich',
  'Took a long nap',
  'Jumped on some piano keys',
  'Is that a mouse?',
  'Scratched a human',
  'Jumped to the top of the shelf!',
  'Do cats know how to tweet? YES, we do.',
  'Set world napping record',
  'xvyadfoiuasdfnasfdn'
]

User.all.each do |user|
  40.times do
    msg = MESSAGES.sample
    Tweet.create!(user_id: user.id, content: msg, created_at: rand(3000).days.ago)
  end
end
