require 'rspec'
require 'p03_hash_set'

describe HashSet do
  let(:set) { HashSet.new(8) }

  describe "#include?" do
    it "should return false unless an element has been inserted" do
      expect(set.include?(1)).to be(false)
    end

    it "should return true if an element has been inserted" do
      set.insert(1)
      expect(set.include?(1)).to be(true)
    end
  end

  describe "#insert" do
    it "should correctly insert any kind of element" do
      set.insert(50)
      set.insert("howdy")
      set.insert([])
      set.insert({:a => 3, :b => 4})

      expect(set.include?(50)).to be(true)
      expect(set.include?(49)).to be(false)

      expect(set.include?("howdy")).to be(true)
      expect(set.include?(:howdy)).to be(false)

      expect(set.include?([])).to be(true)
      expect(set.include?([[]])).to be(false)

      expect(set.include?({:a => 3, :b => 4})).to be(true)
      expect(set.include?({:b => 4, :a => 3})).to be(true)
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
      it "should remove an element from the set" do
        set.insert(1)
        set.remove(1)
        expect(set.include?(1)).to be(false)
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

  describe "#resize!" do
    before do
      allow(set).to receive(:resize!).and_call_original
    end

    it "should resize when enough items are inserted" do
      expect(set).to receive(:resize!).exactly(1).times
      9.times { |i| set.insert(i) }
    end
  end
end
