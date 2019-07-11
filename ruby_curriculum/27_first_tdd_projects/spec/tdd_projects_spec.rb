require 'rspec'
require 'tdd_projects'

describe Array do 
  subject(:non_uniq_arr) { Array.new([1,2,1,3,3]) }
  subject(:two_sum_arr) { Array.new([-1, 0, 2, -2, 1]) }

  describe "#my_uniq" do 
    it "removes duplicate elements"
    it "receives an Array instance"
  end
end