# == Schema Information
#
# Table name: drivers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  bus_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Driver < ApplicationRecord
  belongs_to :bus,
    class_name: 'Bus',
    foreign_key: :bus_id,
    primary_key: :id
end
