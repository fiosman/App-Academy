# == Schema Information
#
# Table name: plants
#
#  id          :bigint           not null, primary key
#  gardener_id :integer
#  species     :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Plant < ApplicationRecord
  belongs_to :gardener,
    class_name: 'Gardener',
    foreign_key: :gardener_id,
    primary_key: :id

  has_many :seeds,
    class_name: 'Seed',
    foreign_key: :plant_id,
    primary_key: :id
end
