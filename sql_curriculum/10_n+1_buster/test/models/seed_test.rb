# == Schema Information
#
# Table name: seeds
#
#  id         :bigint           not null, primary key
#  count      :integer          not null
#  plant_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SeedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
