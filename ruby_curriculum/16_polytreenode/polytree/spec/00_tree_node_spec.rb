require 'rspec'
require '00_tree_node'

describe PolyTreeNode do
  let(:node1) { PolyTreeNode.new('root') }
  let(:node2) { PolyTreeNode.new('child1') }
  let(:node3) { PolyTreeNode.new('child2') }

  describe "#initialize" do
    let(:new_node) { PolyTreeNode.new('new_node') }

    it "should set an initial value" do
      expect(new_node.value).to eq('new_node')
    end

    it "should set parent to nil" do
      expect(new_node.parent).to be_nil
    end

    it "should set children to an empty array" do
      expect(new_node.children).to eq([])
    end
  end

  describe "#parent=" do
    before do
      node2.parent = node1
      node3.parent = node1
    end

    it "should set a node's parent to the passed node" do
      expect(node2.parent).to equal(node1)
      expect(node3.parent).to equal(node1)
    end

    it "should add the child node to the passed node's children" do
      expect(node1.children).to eq([node2, node3])
    end

    it "does not add the same node twice" do
      node3.parent = node1
      expect(node1.children).to eq([node2, node3])
    end

    it "handles nil without issue" do
      node2.parent = nil
      expect(node2.parent).to be_nil
    end

    context "when reassigning" do
      before { node3.parent = node2 }

      it "should set the node's parent to the new parent" do
        expect(node3.parent).to equal(node2)
      end

      it "should add the node to the new parent's children" do
        expect(node2.children).to include(node3)
      end

      it "should remove the node from its old parent's children" do
        expect(node1.children).to_not include(node3)
      end
    end
  end

  describe "#add_child" do
    it "should pass itself to the child's #parent=" do
      expect(node3).to receive(:parent=).with(node2)
      node2.add_child(node3)
    end

    it "doesn't add the child twice" do
      node2.add_child(node3)
      expect(node2.children).to eq([node3])
    end
  end

  describe "#remove_child" do
    before do
      node3.parent = node2
    end

    it "should pass nil to the child's #parent=" do
      expect(node3).to receive(:parent=).with(nil)
      node2.remove_child(node3)
    end

    it "should raise an error if node is not a child" do
      expect do
        node2.remove_child(node1)
      end.to raise_error
    end
  end
end

describe 'Searchable' do
  let(:nodes) { ('a'..'g').map { |value| PolyTreeNode.new(value) } }

  before do
    parent_index = 0
    nodes.each_with_index do |child, index|
      next if index.zero?
      child.parent = nodes[parent_index]
      parent_index += 1 if index.even?
    end
  end

  shared_examples_for 'search method' do
    it "should return itself if it contains the value" do
      expect(nodes.first.send(search_method, 'a')).to equal(nodes.first)
    end

    it "should find descendant" do
      expect(nodes.first.send(search_method, 'g')).to equal(nodes[6])
    end

    it "should return nil when value is not found" do
      expect(nodes.first.send(search_method, 'x')).to be_nil
    end
  end

  describe "#dfs" do
    let(:search_method) { :dfs }
    it_behaves_like 'search method'

    it "should take correct path to descendant" do
      expect(nodes[2]).to_not receive(:dfs)
      [0, 1, 3, 4].each do |index|
        expect(nodes[index]).to receive(:dfs).and_call_original.ordered
      end
      expect(nodes.first.dfs('e')).to equal(nodes[4])
    end
  end

  describe "#bfs" do
    let(:search_method) { :bfs }
    it_behaves_like 'search method'

    it "should take correct path to descendant" do
      expect(nodes[6]).to_not receive(:value)
      [0, 1, 2, 3, 4, 5].each do |index|
        expect(nodes[index]).to receive(:value).and_call_original.ordered
      end
      expect(nodes.first.bfs('f')).to equal(nodes[5])
    end
  end
end
