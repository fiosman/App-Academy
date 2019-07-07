require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Fares") }
  subject(:cupcake) { Dessert.new("cupcake", 15, chef) }

  describe "#initialize" do
    it "sets a type" do 
      expect(cupcake.type).to eq('cupcake')
    end
    it "sets a quantity" do 
      expect(cupcake.quantity).to eq(15)
    end
    it "starts ingredients as an empty array" do 
      expect(cupcake.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("cupcake", "alsdlad", 'Fares')}.to raise_error(ArgumentError) 
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(cupcake.ingredients).to_not include('milk')
      cupcake.add_ingredient('milk')
      expect(cupcake.ingredients).to include('milk')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cupcake.add_ingredient('milk')
      cupcake.add_ingredient('chocolate')
      cupcake.add_ingredient('sugar')
      unshuffled_ingredients = ['milk', 'chocolate', 'sugar']
      expect(cupcake.ingredients).to eq(unshuffled_ingredients)
      cupcake.mix! 
      expect(cupcake.ingredients.sort).to eq(unshuffled_ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      cupcake.eat(5)
      expect(cupcake.quantity).to eq(10)
    end
    it "raises an error if the amount is greater than the quantity" do 
      expect { cupcake.eat(40) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return("Chef Fares the Great Baker")
      expect(cupcake.serve).to eq("Chef Fares the Great Baker has made 15 cupcakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(cupcake)
      cupcake.make_more
    end
  end
end
