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

require 'test_helper'

class PlantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
