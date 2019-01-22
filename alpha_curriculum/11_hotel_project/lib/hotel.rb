require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name 
    @rooms = {}

    hash.each do |k,v| 
      @rooms[k] = Room.new(v)
    end
  end

  def name
    new_name = @name.split(" ")
    new_name.map do |word| 
      word.capitalize!
    end
    return new_name.join(" ")
  end

  def rooms 
    @rooms
  end

  def room_exists?(room_name)
    if @rooms.keys.include?(room_name)
      return true
    else
      return false
    end
  end

  def check_in(person, room)
   if self.room_exists?(room)
    if @rooms[room].add_occupant(person) 
      p "check-in successful"
    else
      p 'sorry, room is full'
    end
  else 
    puts 'sorry, room does not exist'
  end
end

  def has_vacancy? 
    @rooms.values.any? { |room| room.available_space > 0 }
  end

  def list_rooms
    @rooms.each do |room_name, room| 
      p "#{room_name} : #{room.available_space}" 
    end
  end
end



