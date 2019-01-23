require "employee"

describe "PART 1" do
  describe "Employee" do
    let(:employee) { Employee.new("Shaggy", "Junior Developer") }

    it "should have getter methods for @name and @title" do
      expect(employee).to respond_to(:name)
      expect(employee).to respond_to(:title)
    end

    it "should not have a getter method for @earnings" do
      expect(employee).to_not respond_to(:earnings)
    end

    describe "#initialize" do
      it "should accept a name (string) and title (string) as args" do
        employee
      end

      it "should set @name and @title with the args" do
        expect(employee.instance_variable_get(:@name)).to eq("Shaggy")
        expect(employee.instance_variable_get(:@title)).to eq("Junior Developer")
      end

      it "should set @earnings to 0" do
        expect(employee.instance_variable_get(:@earnings)).to eq(0)
      end
    end

    describe "#name" do
      it "should get (return) @name" do
        expect(employee.instance_variable_get(:@name)).to be(employee.name)
      end
    end

    describe "#title" do
      it "should get (return) @title" do
        expect(employee.instance_variable_get(:@title)).to be(employee.title)
      end
    end

    describe "#pay" do
      it "should accept an amount (number) as an arg" do
        employee.pay(42)
      end

      it "should increase @earnings by the given amount" do
        employee.pay(42)
        employee.pay(50)
        expect(employee.instance_variable_get(:@earnings)).to eq(92)
      end
    end
  end
end
