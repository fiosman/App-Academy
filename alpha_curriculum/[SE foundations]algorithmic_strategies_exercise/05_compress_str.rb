# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
  def compress_str(string)
    compressed_str = ""
    string.chars.chunk(&:itself).to_a.each do |ele| 
      if ele.last.length > 1 
        compressed_str += ele.last.length.to_s + ele.first
      else
        compressed_str += ele.first
      end
    end
    compressed_str
  end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
