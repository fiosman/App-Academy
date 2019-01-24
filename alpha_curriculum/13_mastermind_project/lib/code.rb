require 'byebug'

class Code

  attr_reader :pegs 

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    arr_pegs = []
    length.times { arr_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(arr_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise 'Does not contain valid chars'
    else
      @pegs = pegs.map(&:upcase)
    end
  end

  def [](idx)
    @pegs[idx]
  end

  def length 
    @pegs.length
  end

  def num_exact_matches(instance_guess)
    count = 0 
    (0...instance_guess.length).each do |idx| 
      count += 1 if instance_guess[idx] == self[idx]
    end
    count
  end

  def num_near_matches(instance_guess)
    count = 0 
    (0...instance_guess.length).each do |idx| 
      if instance_guess[idx] != self[idx] &&  self.pegs.include?(instance_guess[idx])
        count+=1
      end
    end
    count
  end

  def ==(another_instance)
    self.pegs == another_instance.pegs
  end
  
end


