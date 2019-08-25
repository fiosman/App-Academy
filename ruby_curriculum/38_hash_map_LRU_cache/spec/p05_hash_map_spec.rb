require 'rspec'
require 'p05_hash_map'

describe HashMap do
  let(:hash) do
    hash = HashMap.new
    hash.set(:first, 1)
    hash.set(:second, 2)
    hash.set(:third, 3)
    hash
  end

  describe "#[]" do
    it "gets by key" do
      expect(hash[:first]).to eq(1)
      expect(hash[:second]).to eq(2)
      expect(hash[:third]).to eq(3)
    end

    it "returns nil for absent keys" do
      expect(hash[:fourth]).to be_nil
    end
  end

  describe "#[]=" do
    it "sets a key, value pair" do
      hash[:fourth] = 4
      expect(hash[4]).to be_nil
      expect(hash[:fourth]).to eq(4)
    end

    it "overwrites any existing value for the given key" do
      hash[:one] = 1
      hash[:one] = "one"

      expect(hash[:one]).to eq("one")
    end

    it "works with various data types" do
      hash["fourth"] = 4
      hash[[5]] = 5

      expect(hash["fourth"]).to eq(4)
      expect(hash[[5]]).to eq(5)
    end
  end

  describe "#include?" do
    it "returns true if a key is present" do
      expect(hash).to include(:first)
    end

    it "returns false if a key is not in the hash" do
      expect(hash).to_not include(:fourth)
    end
  end

  describe "#delete" do
    it "deletes keys" do
      expect(hash[:first]).to eq(1)
      hash.delete(:first)
      expect(hash[:first]).to be_nil
    end
  end

  describe "#count" do
    it "keeps count through insertions" do
      expect(hash.count).to eq(3)
    end

    it "does not change count when updating existing key" do
      hash[:first] = 1
      expect(hash.count).to eq(3)
    end

    it "keeps counts through deletions" do
      hash.delete(:first)
      expect(hash.count).to eq(2)
    end
  end

  describe "#each" do
    it "enumerates over all the items and yields key-value pairs" do
      goal = [[:first, 1], [:second, 2], [:third, 3]]
      result = []
      hash.each do |k, v|
        result << [k, v]
      end
      expect(result.sort).to eq(goal)
    end

    it "includes Enumerable module" do
      expect(hash.class.ancestors).to include(Enumerable)
    end
  end

  describe "#resize!" do
    before do
      allow(hash).to receive(:resize!).and_call_original
    end

    it "should call #resize! when enough items are inserted" do
      expect(hash).to receive(:resize!).exactly(1).times
      7.times { |i| hash[i] = i + 1 }
    end

    it "should increase the size of the store" do
      old_store_length = hash.instance_variable_get(:@store).length

      # triggers resize
      7.times { |i| hash[i] = i + 1 }

      new_store_length = hash.instance_variable_get(:@store).length

      expect(new_store_length).to be > old_store_length
    end

    it "should rehash existing values so they can still be accessed" do
      contents = [:first, :second, :third].map do |k|
        [k, hash[k]]
      end

      # triggers resize
      7.times { |i| hash[i] = i + 1 }

      contents.each do |k, v|
        expect(hash[k]).to eq(v)
      end
    end
  end
end
