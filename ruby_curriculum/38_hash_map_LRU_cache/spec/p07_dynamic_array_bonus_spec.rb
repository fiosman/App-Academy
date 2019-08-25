require 'rspec'
require 'p07_dynamic_array_bonus'

describe DynamicArray do
  let(:arr) { DynamicArray.new(3) }

  describe "#initialize" do
    it "should not use a Ruby array" do
      arr.instance_variables.each do |ivar|
        expect(arr.instance_variable_get(ivar).class).not_to eq(Array)
      end
    end
  end

  describe "#push" do
    it "should push items into the array" do
      arr.push(1)
      arr.push(2)
      expect(arr[0]).to eq(1)
      expect(arr[1]).to eq(2)
    end
  end

  describe "#count" do
    it "should keep count of the items in the array" do
      expect(arr.count).to eq(0)
      arr.push(1)
      expect(arr.count).to eq(1)
    end
  end

  describe "#[]" do
    it "should return nil for a positive out of bounds" do
      expect(arr[0]).to be_nil
      arr.push(1)
      expect(arr[1]).to be_nil
      expect(arr[2]).to be_nil
    end
  end

  describe "#[]=" do
    it "should reassign indices in the array" do
      arr.push(1)
      arr.push(2)
      arr[0] = 3
      expect(arr[0]).to eq(3)
    end
  end

  describe "#unshift" do
    it "should add items to the beginning of the array and shift others over" do
      arr.push(1)
      arr.push(2)
      arr.unshift(0)
      expect(arr[0]).to eq(0)
      expect(arr[1]).to eq(1)
      expect(arr[2]).to eq(2)
      expect(arr[3]).to be_nil
    end
  end

  describe "#pop" do
    it "should pop off items from the end" do
      arr.push(1)
      arr.push(2)

      expect(arr.pop).to eq(2)
      expect(arr.count).to eq(1)

      expect(arr.pop).to eq(1)
      expect(arr.count).to eq(0)
      expect(arr[0]).to be_nil
    end

    it "should return nil if nothing can be popped" do
      expect(arr.pop).to be_nil
    end
  end

  describe "#shift" do
    it "should shift off items from the beginning" do
      arr.push(1)
      arr.push(2)

      expect(arr.shift).to eq(1)
      expect(arr.count).to eq(1)

      expect(arr.shift).to eq(2)
      expect(arr.count).to eq(0)
      expect(arr[0]).to be_nil
    end

    it "should return nil if nothing can be shifted" do
      expect(arr.shift).to be_nil
    end
  end

  describe "#first" do
    it "should return the first item" do
      arr.push(1)
      arr.push(2)

      expect(arr.first).to eq(1)
      expect(arr[0]).to eq(1)
    end
  end

  describe "#last" do
    it "should return the last item" do
      arr.push(1)
      arr.push(2)

      expect(arr.last).to eq(2)
      expect(arr[1]).to eq(2)
    end
  end

  describe "#each" do
    it "should enumerate through the array" do
      arr.push(1)
      arr.push(2)
      arr.push(3)

      shoulds = [1, 2, 3]
      els = []
      arr.each do |el|
        els << el
      end
      expect(els).to eq(shoulds)
    end

    it "should include the Enumerable module" do
      expect(arr.class.ancestors).to include(Enumerable)
    end
  end

  describe "#include?" do
    it "should check for inclusion" do
      expect(arr.include?(1)).to be(false)
      arr.push(1)
      expect(arr.include?(1)).to be(true)
    end
  end

  describe "#resize!" do
    before do
      allow(arr).to receive(:resize!).and_call_original
    end

    it "should call #resize! when too many elements are inserted" do
      (1..3).each { |i| arr.push(i) }
      expect(arr.capacity).to eq(3)

      expect(arr).to receive(:resize!).exactly(1).times
      arr.push(4)
    end

    it "resizing should double the array's capacity" do
      (1..3).each { |i| arr.push(i) }
      expect(arr.capacity).to eq(3)

      arr.push(4)
      expect(arr.capacity).to eq(6)
      arr.shift
    end

    it "should retain its size when elements are removed" do
      (1..4).each { |i| arr.push(i) }
      arr.shift
      expect(arr.capacity).to eq(6)
    end
  end

  describe "#==" do
    it "should return false unless the object is an array" do
      expect(arr).not_to eq({})
      arr.push(1)
      expect(arr).not_to eq(1)
    end

    it "should check for equality with a dynamic or Ruby array" do
      real_arr = []
      other_dyna = DynamicArray.new(4)
      (1..5).each do |n|
        arr.push(n)
        real_arr << n
        other_dyna.push(n)
      end
      expect(arr).to eq(real_arr)
      expect(arr).to eq(other_dyna)

      real_arr[2] = 4
      expect(arr).not_to eq(real_arr)
    end

    it "should respect ordering" do
      real_arr = []
      (1..500).each do |n|
        arr.push(n)
        real_arr << n
      end
      real_arr.shuffle!

      expect(arr).not_to eq(real_arr)
    end
  end

  describe "negative indexing" do
    it "should perform negative indexing correctly" do
      (1..5).each { |n| arr.push(n) }
      expect(arr[-1]).to eq(5)
      expect(arr[-6]).to be_nil
      arr.shift
      arr.push(6)

      expect(arr[4]).to eq(6)
      expect(arr[-1]).to eq(6)
      expect(arr[-5]).to eq(2)
      expect(arr[-6]).to be_nil

      5.times { arr.shift }

      (1..100).each { |n| arr.push(n) }
      expect(arr[-6]).to eq(95)

      arr[-1] = 200
      expect(arr[99]).to eq(200)
    end
  end

  describe "over-indexing" do
    it "should push nils when over-indexing" do
      arr[2] = 0
      expect(arr).to eq([nil, nil, 0])
      arr.shift
      arr[5] = 0
      expect(arr).to eq([nil, 0, nil, nil, nil, 0])
    end
  end
end
