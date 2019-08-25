require 'rspec'
require 'p01_int_set'

describe MaxIntSet do
  let(:set) { MaxIntSet.new(50) }

  describe "#include?" do
    it "should return false unless the number has been inserted" do
      expect(set).to_not include(1)
    end

    it "should return true if the number has been inserted" do
      set.insert(1)
      expect(set).to include(1)
    end
  end

  describe "#insert" do
    it "should be able to insert numbers within range" do
      expect { set.insert(49) }.not_to raise_error
    end

    it "should raise an error when inserting numbers that are out of range" do
      expect{ set.insert(51) }.to raise_error("Out of bounds")
      expect{ set.insert(-1) }.to raise_error("Out of bounds")
    end

    it "values in the store should be booleans corresponding to presence" do
      set.insert(1)
      expect(set.store[1]).to be true
    end
  end

  describe "#remove" do
    it "should remove a number from the set" do
      set.insert(1)
      set.remove(1)
      expect(set).to_not include(1)
    end
  end
end

describe IntSet do
  let(:set) { IntSet.new(20) }

  describe "#include?" do
    it "should return false unless the number has been inserted" do
      expect(set).to_not include(1)
    end

    it "should return true if the number has been inserted" do
      set.insert(1)
      expect(set).to include(1)
    end
  end

  describe "#insert" do
    it "should be able to insert any numbers" do
      expect { set.insert(49) }.not_to raise_error
      set.insert(50)
      expect(set).to include(50)
    end
  end

  describe "#remove" do
    it "should remove a number from the set" do
      set.insert(1)
      set.remove(1)
      expect(set).to_not include(1)
    end
  end
end

describe ResizingIntSet do
  let(:set) { ResizingIntSet.new(20) }

  describe "#include?" do
    it "should return false unless the number has been inserted" do
      expect(set).to_not include(1)
    end

    it "should return true if the number has been inserted" do
      set.insert(1)
      expect(set).to include(1)
    end
  end

  describe "#insert" do
    it "should be able to insert any numbers" do
      expect { set.insert(49) }.not_to raise_error
      set.insert(50)
      expect(set).to include(50)
    end

    it "should not insert the same item twice" do
      3.times { set.insert(1) }
      expect(set.count).to eq(1)
    end
  end

  describe "#remove" do
    before do
      set.insert(1)
    end

    context "if the number exists in the set" do
      before do
        set.remove(1)
      end
      it "should remove a number from the set" do
        expect(set).to_not include(1)
      end

      it "decrements the count" do
        expect(set.count).to eq(0)
      end
    end

    context "if the number doesn't exist in the set" do
      it "should do nothing when removing an item that hasn't been added" do
        expect(set.count).to eq(1)
        set.remove(2)
        expect(set.count).to eq(1)
      end
    end


  end

  describe "#count" do
    it "should keep track of how many entries the set has" do
      expect(set.count).to eq(0)
      5.times { |i| set.insert(i) }
      expect(set.count).to eq(5)
    end
  end

  describe "#resize!" do
    before do
      allow(set).to receive(:resize!).and_call_original
    end

    it "should resize when enough items are inserted" do
      expect(set).to receive(:resize!).exactly(1).times
      21.times { |i| set.insert(i)}
    end

    it "should move elements into the correct bucket after resizing" do
      elements = (10..30).to_a
      elements.each { |el| set.insert(el) }
      elements.each do |el|
        expect(set).to include(el)
      end
    end

    it "should create twice as many buckets" do
      prev_num_buckets = set.send(:num_buckets)
      21.times { |i| set.insert(i) }
      expect(set.send(:num_buckets)).to eq(2 * prev_num_buckets)
    end

    it "should not change the count of the set" do
      elements = (10..30).to_a
      elements.each { |el| set.insert(el) }
      expect(set.count).to eq(elements.count)
    end
  end
end
