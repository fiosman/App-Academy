require "array"

describe "Array" do
  describe "PART 1" do
    describe "#span" do
      context "when the array contains numbers as elements" do
        it "should return the difference between the largest and smallest element" do
          expect([12, 24, 23, 11, 17].span).to eq(13)
          expect([13, 10].span).to eq(3)
          expect([12].span).to eq(0)
        end
      end

      context "when the array is empty" do
        it "should return nil" do
          expect([].span).to eq(nil)
        end
      end
    end

    describe "#average" do
      context "when the array contains numbers as elements" do
        it "should return a number representing the average value of the elements" do
          expect([4, 7, 13, 5].average).to eq(7.25)
          expect([5, 11].average).to eq(8)
        end
      end

      context "when the array is empty" do
        it "should return nil" do
          expect([].average).to eq(nil)
        end
      end
    end

    describe "#median" do
      context "when there is an odd number of elements" do
        it "should return the middle element of the array when sorted" do
          expect([5, 0, 2, 6, 11, 10, 9].median).to eq(6) 
          expect([5, 10, 9].median).to eq(9)
        end
      end

      context "when there is an even number of elements" do
        it "should return the average of the two middle elements when sorted" do
          expect([3, 8, 4, 5].median).to eq(4.5)
          expect([10, 23].median).to eq(16.5)
        end
      end

      context "when the array is empty" do
        it "should return nil" do
          expect([].median).to eq(nil)
        end
      end
    end

    describe "#counts" do
      it "should return a hash representing the count of each element of the array" do
        expect(["a", "b", "a", "b", "b", "c"].counts).to eq({"a"=>2, "b"=>3, "c"=>1})
        expect([].counts).to eq({})
      end
    end
  end

  describe "PART 2" do
    describe "#my_count" do
      it "should accept any value as an argument and return the number of times that value appears in the array" do
        expect(["a", "b", "a", "a", "b"].my_count("a")).to eq(3)
        expect(["a", "b", "b", "b", "b"].my_count("b")).to eq(4)
        expect(["a", "b"].my_count("c")).to eq(0)
      end

      it "should not use the built-in Array#count" do
        arr = ["a", "b", "a", "a", "b"]
        expect(arr).to_not receive(:count)
        arr.my_count("a")
      end
    end

    describe "#my_index" do
      it "should accept any value as an argument and return the index where that element is found in the array" do
        expect(["a", "b", "c", "d"].my_index("c")).to eq(2)
        expect(["a", "b", "c", "d"].my_index("a")).to eq(0)
      end

      context "when the value appears multiple times in the array" do
        it "should return the smallest index where it is found" do
          expect(["a", "b", "c", "a", "b"].my_index("b")).to eq(1)
          expect(["a", "b", "c", "a", "b"].my_index("a")).to eq(0)
        end
      end

      context "when the value does not appear in the array" do
        it "should return nil" do
          expect(["a", "b", "c"].my_index("z")).to eq(nil)
        end
      end

      it "should not use the built-in Array#index" do
        arr = ["a", "b", "c", "d"]
        expect(arr).to_not receive(:index)
        arr.my_count("c")
      end
    end

    describe "#my_uniq" do
      it "should return a new array without duplicate elements in the order they first appeared in the original array" do
        expect(["a", "b", "a", "a", "b"].my_uniq).to eq(["a", "b"])
        expect([4, 1, 1, 3].my_uniq).to eq([4, 1, 3])
      end

      it "should not use the built-in Array#uniq" do
        arr = ["a", "b", "a", "a", "b"]
        expect(arr).to_not receive(:uniq)
        arr.my_uniq
      end
    end

    describe "#my_transpose" do
      it "should transpose a 2D array with square dimensions by returning a new 2D array where the horizontal rows are converted to vertical columns" do
        arr_1 = [
          ["a", "b", "c"],
          ["d", "e", "f"],
          ["g", "h", "i"]
        ]
        expected_1 = [
          ["a", "d", "g"],
          ["b", "e", "h"],
          ["c", "f", "i"]
        ]
        expect(arr_1.my_transpose).to eq(expected_1)

        arr_2 = [
          ["w", "x"],
          ["y", "z"]
        ]
        expected_2 = [
          ["w", "y"],
          ["x", "z"]
        ]
        expect(arr_2.my_transpose).to eq(expected_2)
      end


      it "should not use the built-in Array#transpose" do
        arr = [
          ["a", "b"],
          ["c", "d"]
        ]
        expect(arr).to_not receive(:transpose)
        arr.my_transpose
      end
    end
  end
end
