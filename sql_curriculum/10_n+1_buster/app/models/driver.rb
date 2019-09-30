class Driver < ApplicationRecord
  belongs_to :bus,
    class_name: 'Bus',
    foreign_key: :bus_id,
    primary_key: :id
end
