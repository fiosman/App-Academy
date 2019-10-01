# == Schema Information
#
# Table name: gardeners
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  house_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GardenerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
