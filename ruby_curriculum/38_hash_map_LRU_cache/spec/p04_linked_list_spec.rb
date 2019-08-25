require 'rspec'
require 'p04_linked_list'

describe LinkedList do
  let(:k_v_pairs) do
    { first: 1, second: 2, third: 3 }
  end

  let(:empty_list) { LinkedList.new }

  let(:list) do
    list = LinkedList.new
    k_v_pairs.each do |key, val|
      list.append(key, val)
    end
    list
  end

  describe "#initialize" do
    list = LinkedList.new

    it "creates a head node" do
      expect(list.instance_variable_get(:@head).class).to be(Node)
    end
    it "creates a tail node" do
      expect(list.instance_variable_get(:@tail).class).to be(Node)
    end
    it "sets the next node of head to tail" do
      expect(list.instance_variable_get(:@head).next).to eq(list.instance_variable_get(:@tail))
    end
    it "sets the prev node of tail to head" do
      expect(list.instance_variable_get(:@tail).prev).to eq(list.instance_variable_get(:@head))
    end
  end

  describe "#empty" do
    it "checks whether any nodes have been inserted" do
      expect(empty_list.empty?).to be true
      expect(list.empty?).to be false
    end
  end

  describe "#append" do
    it "appends nodes" do
      empty_list.append(:first, 1)
      expect(empty_list).to_not be_empty
      expect(empty_list.first.key).to be(:first)
      expect(empty_list.last.key).to be(:first)
    end

    it "appends nodes in order" do
      expect(list.first.key).to be(:first)
      expect(list.last.key).to be(:third)
    end
  end

  describe "#each" do
    it "enumerates over the nodes and yields each successive node" do
      list_vals_ordered = k_v_pairs.values
      list_vals_yielded = []
      list.each do |node|
        list_vals_yielded << node.val
      end
      expect(list_vals_yielded).to eq(list_vals_ordered)
    end
  end

  describe "#update" do
    it "updates nodes" do
      empty_list.append(:first, 1)
      empty_list.update(:first, 2)
      expect(empty_list.first.val).to be 2
    end

    it "doesn't add new nodes" do
      empty_list.update(:first, 2)
      expect(empty_list.empty?).to be true
    end
  end

  describe "#get" do
    it "gets by key" do
      expect(list.get(:first)).to eq(1)
      expect(list.get(:second)).to eq(2)
      expect(list.get(:third)).to eq(3)
    end

    it "returns nil for absent keys" do
      expect(list.get(:absent_key)).to be_nil
    end
  end

  describe "#remove" do
    it "removes a node by key" do
      expect(list.get(:first)).to eq(1)
      list.remove(:first)
      expect(list.get(:first)).to be_nil
    end

    it "reassigns pointers when nodes are removed" do
      list.remove(:second)

      expect(list.first.next.key).to be(:third)
      expect(list.last.prev.key).to be(:first)
    end
  end

  describe "#include?" do
    it "returns true if a key is present" do
      expect(list.include?(:first)).to be true
    end

    it "returns false if a key is not in the list" do
      expect(list.include?(:fourth)).to be false
    end
  end

  describe "#[]" do
    it "can look up nodes by index" do
      expect(list[0].key).to eq(:first)
      expect(list[1].key).to eq(:second)
      expect(list[2].key).to eq(:third)
    end
  end

  it "includes Enumerable module" do
    expect(list.class.ancestors).to include(Enumerable)
  end
end
