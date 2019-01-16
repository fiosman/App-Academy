require "rspec"
require "02_eval_block"

describe "#eval_block" do
  context "when a block is given" do
    it "passes the arguments into the block" do
      expect do |block|
        eval_block(1, 2, 3, &block)
      end.to yield_with_args(1, 2, 3)
    end
  end

  context "when no block is given" do
    it "raises an error" do
      expect { eval_block(1, 2, 3) }.to raise_error
    end
  end
end
