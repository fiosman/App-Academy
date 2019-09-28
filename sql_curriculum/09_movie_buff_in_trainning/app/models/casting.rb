class Casting < ApplicationRecord
  belongs_to :actor
  # shorthand for:
  # belongs_to :actor,
  # class_name: 'Actor',
  # foreign_key: :actor_id,
  # primary_key: :id

  belongs_to :movie
  # shorthand for:
  # belongs_to :movie,
  # class_name: 'Movie',
  # foreign_key: :movie_id,
  # primary_key: :id
end
