class Bus < ApplicationRecord
  belongs_to :route,
    class_name: 'Route',
    foreign_key: :route_id,
    primary_key: :id

  has_many :drivers,
    class_name: 'Driver',
    foreign_key: :bus_id,
    primary_key: :id
end
