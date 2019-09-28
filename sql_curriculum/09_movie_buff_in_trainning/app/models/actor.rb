class Actor < ApplicationRecord
  has_many :castings
  # shorthand for:
  # has_many :castings,
  # class_name: 'Casting',
  # foreign_key: :actor_id,
  # primary_key: :id

  has_many :movies, through: :castings
  # shorthand for:
  # has_many :movies,
  # through: :castings,
  # source: :movie

  has_many :directed_movies,
    foreign_key: :director_id,
    class_name: 'Movie'
  # shorthand for:
  # has_many :directed_movies,
  # foreign_key: :director_id,
  # class_name: "Movie"
  # primary_key: :id
end
