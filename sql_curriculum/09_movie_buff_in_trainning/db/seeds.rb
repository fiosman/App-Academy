# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Actor.destroy_all
Movie.destroy_all
Casting.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('actors')
ActiveRecord::Base.connection.reset_pk_sequence!('movies')
ActiveRecord::Base.connection.reset_pk_sequence!('castings')

ActiveRecord::Base.transaction do
	puts "Preparing #{Rails.env} environment"
	puts 'Loading actors...'
	require_relative 'data/actors.rb'
	puts 'Loading movies...'
	require_relative 'data/movies.rb'
	puts 'Loading castings...'
	require_relative 'data/castings.rb'
	puts "Done with #{Rails.env} environment!"
end
