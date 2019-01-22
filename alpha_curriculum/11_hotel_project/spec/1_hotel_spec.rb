require "hotel"
require "room"

# The code below suppresses stdout while rspec runs.
# Our Hotel class will print to stdout and we want to avoid that
# output from cluttering the rspec output
################################################################
RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end
  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end
################################################################

puts "\nNOTE: Once you complete all specs, run `ruby lib/simulate_hotel.rb` in your terminal!"

describe "PART 2" do
  describe "Hotel" do
    let(:hotel) { Hotel.new("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1) }

    let(:full_hotel) do
      hotel = Hotel.new("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1)
      hotel.check_in("Jesse", "Basement")
      hotel.check_in("Walter", "Basement")
      hotel.check_in("Gus", "Basement")
      hotel.check_in("Hank", "Basement")
      hotel.check_in("Rick", "Attic")
      hotel.check_in("Morty", "Attic")
      hotel.check_in("Harry", "Under the Stairs")
      hotel
    end

    describe "#initialize" do
      it "should accept a name (string) and hash where keys are room names (strings) and values are corresponding capacities (numbers)" do
        hotel
      end

      it "should set @name" do
        expect(hotel.instance_variable_get(:@name)).to eq("hilbert's grand hotel")
      end

      it "should set @rooms to a new hash where keys are the room names from the hash arg and values are Room instances with the specified capacities" do
        rooms = hotel.instance_variable_get(:@rooms)

        expect(rooms).to be_a(Hash)

        expect(rooms["Basement"]).to be_a(Room)
        expect(rooms["Basement"].capacity).to eq(4)

        expect(rooms["Attic"]).to be_a(Room)
        expect(rooms["Attic"].capacity).to eq(2)

        expect(rooms["Under the Stairs"]).to be_a(Room)
        expect(rooms["Under the Stairs"].capacity).to eq(1)
      end

      it "should call Room#initialize for each key of the hash arg" do
        expect(Room).to receive(:new).exactly(3).times
        hotel
      end
    end

    describe "#name" do
      it "should get (return) a version of @name where every word is capitalized" do
        expect(hotel.name).to eq("Hilbert's Grand Hotel")
      end

      it "should not mutate the original @name" do
        expect(hotel.instance_variable_get(:@name)).to eq("hilbert's grand hotel")
      end
    end

    describe "#rooms" do
      it "should get (return) @rooms" do
        expect(hotel.rooms).to be(hotel.instance_variable_get(:@rooms))
      end
    end

    describe "#room_exists?" do
      it "should accept a room name (string) as an arg" do
        hotel.room_exists?("Basement")
      end

      context "when the room exists in the hotel" do
        it "should return true" do
          expect(hotel.room_exists?("Basement")).to eq(true)
        end
      end

      context "when the room does not exist in the hotel" do
        it "should return false" do
          expect(hotel.room_exists?("Closet")).to eq(false)
        end
      end
    end

    describe "#check_in" do
      it "should accept a person (string) and a room name (string) as args" do
        hotel.check_in("Rick", "Attic")
      end

      context "when the specified room does not exist" do
        it "should print 'sorry, room does not exist'" do
          expect { hotel.check_in("Rick", "Kitchen") }.to output(/sorry/).to_stdout
        end
      end

      it "should call Hotel#room_exists?" do
        expect(hotel).to receive(:room_exists?)
        hotel.check_in("Rick", "Kitchen")
      end

      context "when the specified room does exist" do
        it "should call Room#add_occupant on the correct Room instance" do
          rooms = hotel.instance_variable_get(:@rooms)
          expect(hotel.rooms["Attic"]).to receive(:add_occupant)
          hotel.check_in("Rick", "Attic")
        end

        context "when Room#add_occupant succeeds" do
          it "should print 'check in successful'" do
            expect { hotel.check_in("Rick", "Attic") }.to output(/successful/).to_stdout
            expect { hotel.check_in("Morty", "Attic") }.to output(/successful/).to_stdout
          end
        end

        context "when Room#add_occupant fails" do
          it "should print 'sorry, room is full'" do
            hotel.check_in("Rick", "Attic")
            hotel.check_in("Morty", "Attic")
            expect { hotel.check_in("Jerry", "Attic") }.to output(/sorry/).to_stdout
          end
        end
      end
    end

    describe "#has_vacancy?" do
      context "when all hotel rooms are full" do
        it "should return false" do
          expect(full_hotel.has_vacancy?).to eq(false)
        end
      end

      context "when at least 1 room is available" do
        it "should return true" do
          hotel.check_in("Harry", "Under the Stairs")
          expect(hotel.has_vacancy?).to eq(true)
        end
      end
    end

    describe "#list_rooms" do
      it "should print out every room name followed by the number of available spaces in that room" do
        hotel.check_in("Harry", "Under the Stairs")
        expect { hotel.list_rooms }.to output(/Basement.*4\nAttic.*2\nUnder the Stairs.*0\n/).to_stdout
      end

      it "should call Room#available_space" do
        expect(hotel.rooms["Basement"]).to receive(:available_space)
        hotel.list_rooms
      end
    end
  end
end
