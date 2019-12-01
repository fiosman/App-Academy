# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Cat.destroy_all
CatRentalRequest.destroy_all

last_year = Date.today.prev_year.year

10.times do
  u = User.create!(username: Faker::Name.name, password: "password")
  c = Cat.create!(
    user_id: u.id,
    name: Faker::Hipster.word,
    color: Cat::CAT_COLORS.sample,
    sex: ["M", "F"].sample,
    description: Faker::Hipster.sentence,
    birth_date: Faker::Date.between(from: 10.years.ago, to: Date.today)
  )
    CatRentalRequest.create!(
    cat_id: Cat.last.id,
    user_id: User.last.id,
    start_date: Date.parse("#{last_year.to_s}-01-01"),
    end_date: Date.parse("#{last_year.to_s}-01-28"),
    status: 'APPROVED'
  )
end
