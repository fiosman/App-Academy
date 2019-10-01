# == Schema Information
#
# Table name: routes
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    buses = self.buses.includes(:drivers) 

    each_bus_drivers = {}

    buses.each do |bus| 
      bus_drivers = []
      bus.drivers.each do |bus_driver| 
        bus_drivers << bus_driver.name
      end
      each_bus_drivers[bus.id] = bus_drivers
    end
    
    each_bus_drivers
  end
end
