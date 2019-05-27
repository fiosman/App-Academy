# PHASE 2
def convert_to_int(str)
  Integer(str)

rescue ArgumentError => e
  p "Cannot convert #{str} to an integer!"
  p "Error was #{e.message}"
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message 
    puts "Oh I love Coffee! Lets try again!"
  end
end

class InvalidFruit < StandardError 
  def message 
    puts "This is not a valid fruit!"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit.downcase == "coffee"
    raise CoffeeError
  else
    raise InvalidFruit
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  
  begin 
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp 
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue InvalidFruit => e 
    puts e.message
  end
end  

# PHASE 4

class BestFriendError < StandardError
end

class EmptyStringError < StandardError 
end

class BestFriend

  def self.test_years(yrs_known) 
    if yrs_known < 5
      raise BestFriendError.new "Must have known someone for atleast 5 years to be friends with them!"
    else
      @years_known = yrs_known
    end
  end

  def self.name_length(name)
    if name.length <= 0 
      raise EmptyStringError.new "You must enter a name!"
    else 
      @name = name
    end
  end

  def self.fav_pastime_length(time)
    if time.length <= 0 
      raise EmptyStringError.new "You must enter a favorite past time!"
    else 
      @fav_pastime = time
    end
  end

  def initialize(name, yrs_known, fav_pastime)
    @name = BestFriend.name_length(name)
    @yrs_known = BestFriend.test_years(yrs_known)
    @fav_pastime = BestFriend.fav_pastime_length(fav_pastime)
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


