require "dog"

describe "Dog" do
  let(:dog) { Dog.new("Fido", "German Shepard", 3, "Bork!", ["Bacon", "Chicken"])}

  describe "#initialize" do
    it "should accept a name (string), breed (string), age (number), bark (string), and favorite_foods (array) as arguments" do
      dog
    end

    it "should set the instance variables @name, @breed, @age, @bark, @favorite_foods" do
      expect(dog.instance_variable_get(:@name)).to eq("Fido")
      expect(dog.instance_variable_get(:@breed)).to eq("German Shepard")
      expect(dog.instance_variable_get(:@age)).to eq(3)
      expect(dog.instance_variable_get(:@bark)).to eq("Bork!")
      expect(dog.instance_variable_get(:@favorite_foods)).to eq(["Bacon", "Chicken"])
    end
  end

  describe "#name" do
    it "should get (return) the dog's name instance variable" do
      expect(dog.name).to be(dog.instance_variable_get(:@name))
    end
  end

  describe "#breed" do
    it "should get (return) the dog's breed instance variable" do
      expect(dog.breed).to be(dog.instance_variable_get(:@breed))
    end
  end

  describe "#age" do
    it "should get (return) the dog's age instance variable" do
      expect(dog.age).to be(dog.instance_variable_get(:@age))
    end
  end

  describe "#age=" do
    it "should set the dog's age instance variable to a new number" do
      dog.age = 42
      expect(dog.age).to eq(42)
    end
  end

  describe "#bark" do
    it "should return the dog's uppercase bark if the dog's age is greater than 3" do
      dog.age = 5
      expect(dog.bark).to eq("BORK!")
    end

    it "should return the dog's lowercase bark if the dog's age is less than or equal to 3" do
      dog.age = 3
      expect(dog.bark).to eq("bork!")

      dog.age = 2
      expect(dog.bark).to eq("bork!")
    end
  end

  describe "#favorite_foods" do
    it "should return the dog's favorite_foods instance variable" do
      expect(dog.favorite_foods).to be(dog.instance_variable_get(:@favorite_foods))
    end
  end

  describe "#favorite_food?" do
    it "should accept a food item (string) as a parameter and return a boolean indicating whether the dog's @favorite_foods contain that food item" do
      expect(dog.favorite_food?("Bacon")).to eq(true)
      expect(dog.favorite_food?("Banana")).to eq(false)
    end

    it "should match food items regardless of capitalization" do
      expect(dog.favorite_food?("bacon")).to eq(true)
      expect(dog.favorite_food?("ChIckEn")).to eq(true)
    end
  end
end
