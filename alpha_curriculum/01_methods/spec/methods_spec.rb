require 'methods'

describe "methods.rb" do
  describe "my_to_s" do
    it "converts a number to a string" do
      expect(my_to_s(35)).to eq("35")
    end

    it "converts a symbol to a string" do
      expect(my_to_s(:xy)).to eq("xy")
    end
  end

  describe "my_round" do
    it "rounds 1.4 to 1" do
      expect(my_round(1.4)).to eq(1)
    end

    it "rounds 1.5 to 2" do
      expect(my_round(1.5)).to eq(2)
    end

    it "rounds 2 to 2" do
      expect(my_round(2)).to eq(2)
    end
  end

  describe "my_modulo" do
    it "knows 8 mod 3 is 2" do
      expect(my_modulo(8, 3)).to be(2)
    end

    it "knows 5 mod 6 is 5" do
      expect(my_modulo(5, 6)).to eq(5)
    end
  end

  describe "my_lcm" do
    it "correctly computes the lcm of two numbers" do
      expect(my_lcm(18, 0)).to be(0)
      expect(my_lcm(2, 4)).to be(4)
      expect(my_lcm(2, 3)).to be(6)
      expect(my_lcm(10, 6)).to be(30)
    end
  end

  describe "to_stringified_float" do
    it 'converts 1 to "1.0"' do
      expect(to_stringified_float(1)).to eq("1.0")
    end
  end

  describe "absolute_sum" do
    it "computes the sum of the absolute values of two positive numbers" do
      expect(absolute_sum(2, 3)).to eq(5)
    end

    it "computes the sum of the absolute values of two negative numbers" do
      expect(absolute_sum(-2, -3)).to eq(5)
    end

    it "computes the sum of the absolute values mixed parity numbers" do
      expect(absolute_sum(-2, 3)).to eq(5)
    end
  end

  describe "negative" do
    it "turns a positive number negative" do
      expect(negative(5)).to eq(-5)
    end

    it "keeps a negative number negative" do
      expect(negative(-5)).to eq(-5)
    end
  end

  describe "last_digit" do
    it "returns the last digit of 2" do
      expect(last_digit(2)).to eq 2
    end

    it "returns the last digit of 159293" do
      expect(last_digit(159293)).to eq 3
    end
  end

  describe "last_digit_odd?" do
    it "returns true given 25" do
      expect(last_digit_odd?(25)).to be true
    end

    it "returns true given 25" do
      expect(last_digit_odd?(52)).to be false
    end
  end

  describe "gcd_of_last_digits" do
    it "works on 18 and 36" do
      expect(gcd_of_last_digits(18, 36)).to eq(2)
    end

    it "works on 5 and 27" do
      expect(gcd_of_last_digits(5, 27)).to eq(1)
    end
  end

  describe "last_n_digits" do
    it "returns that last digit of a number" do
      expect(last_n_digits(12345, 1)).to eq 5
    end

    it "returns that last several digits of a number" do
      expect(last_n_digits(12345, 2)).to eq 45
      expect(last_n_digits(12345, 5)).to eq 12345
    end
  end

  describe "dec_remainder_of_two_floats" do
    it "calculates the decimal part of the remainder of two floats" do
      expect(dec_remainder_of_two_floats(8.0, 5.0).round(2)).to eq(0.6)
      expect(dec_remainder_of_two_floats(4.0, 5.0).round(2)).to eq(0.8)
    end
  end

  describe "dec_remainder_of_two_integers" do
    it "calculates the decimal part of the remainder of two ints" do
      expect(dec_remainder_of_two_integers(8, 5).round(2)).to eq(0.6)
      expect(dec_remainder_of_two_integers(4, 5).round(2)).to eq(0.8)
    end
  end

  describe "int_remainder_without_modulo" do
    it "knows 8 mod 3 is 2" do
      expect(int_remainder_without_modulo(8, 3)).to be(2)
    end

    it "knows 5 mod 6 is 5" do
      expect(int_remainder_without_modulo(5, 6)).to eq(5)
    end

    it "doesn't use the % operator" do
      a = double('Integer').as_null_object
      expect(a).not_to receive(:%)
      int_remainder_without_modulo(a, 2)
    end
  end
end
