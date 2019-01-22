require "room"

describe "PART 1" do
  describe "Room" do
    let(:room) { Room.new(3) }

    describe "#initialize" do
      it "should accept a capacity (number) as an arg and set @capacity" do
        expect(room.instance_variable_get(:@capacity)).to eq(3)
      end

      it "should set @occupants to an empty array" do
        expect(room.instance_variable_get(:@occupants)).to eq([])
      end
    end

    describe "#capacity" do
      it "should get (return) @capacity" do
        expect(room.capacity).to be(room.instance_variable_get(:@capacity))
      end
    end

    describe "#occupants" do
      it "should get (return) @occupants" do
        expect(room.occupants).to be(room.instance_variable_get(:@occupants))
      end
    end

    describe "#full?" do
      context "when the number of @occupants is below @capacity" do
        it "should return false" do
          room.occupants.push("Dave")
          expect(room.full?).to eq(false)
        end
      end

      context "when the number of @occupants has met @capacity" do
        it "should return true" do
          room.occupants.push("Dave", "Vanessa", "Mary")
          expect(room.full?).to eq(true)
        end
      end
    end

    describe "#available_space" do
      it "should return the number of additional occupants the room can take before reaching @capacity" do
        expect(room.available_space).to eq(3)

        room.occupants << "Dave"
        expect(room.available_space).to eq(2)
      end
    end

    describe "#add_occupant" do
      it "should accept a person's name (string) as an arg " do
        room.add_occupant("Kevin")
      end

      it "should call Room#full?" do
        expect(room).to receive(:full?)
        room.add_occupant("Kevin")
      end

      context "when the room is not full" do
        it "should add that name to @occupants" do
          room.add_occupant("Kevin")
          room.add_occupant("Candace")
          expect(room.occupants).to eq(["Kevin", "Candace"])
        end

        it "should return true" do
          expect(room.add_occupant("Kevin")).to be(true)
        end
      end

      context "when the room is already full" do
        it "should not add the name" do
          room.add_occupant("Kevin")
          room.add_occupant("Candace")
          room.add_occupant("Shawn")
          room.add_occupant("Ryan")
          expect(room.occupants).to eq(["Kevin", "Candace", "Shawn"])
        end

        it "should return false" do
          room.add_occupant("Kevin")
          room.add_occupant("Candace")
          room.add_occupant("Shawn")
          expect(room.add_occupant("Ryan")).to be(false)
        end
      end
    end
  end
end
