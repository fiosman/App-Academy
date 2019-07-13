require 'rspec'
require 'tdd_projects'

describe Array do 
  subject(:non_uniq_arr) { Array.new([1,2,1,3,3]) }
  subject(:two_sum_arr) { Array.new([-1,0,2,-2,1]) }

  describe "#my_uniq" do 
    it 'removes duplicate elements' do 
      expect(non_uniq_arr.my_uniq).to eq([1,2,3])
    end
    it 'returns an instance of the Array class' do 
      expect(non_uniq_arr.my_uniq.instance_of?(Array)).to eq(true)
    end
  end

  describe "#two_sum" do 
    
  end
end