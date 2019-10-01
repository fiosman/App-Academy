# == Schema Information
#
# Table name: buses
#
#  id         :bigint           not null, primary key
#  model      :string           not null
#  route_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
