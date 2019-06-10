require 'byebug'

class Board
  attr_accessor :cups
  attr_reader :player_1, :player_2

  def initialize(name1, name2)
    @cups, @player_1, @player_2 = Array.new(14) { Array.new }, name1, name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each.with_index do |cup, idx| 
      unless idx == 6 || idx == 13
        4.times { cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0,13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    starting_cup = @cups[start_pos]
    current_position = start_pos 

    until starting_cup.empty? 
      current_position += 1
      current_position = 0 if current_position > 13
      case current_position 
      when 6 
        @cups[current_position] << starting_cup.shift if current_player_name == @player_1
      when 13 
        @cups[current_position] << starting_cup.shift if current_player_name == @player_2
      else 
        @cups[current_position] << starting_cup.shift
      end
    end

    render
    next_turn(current_position)
  end
    
  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?

    @cups[0..5].each do |cup| 
      return true if cup.all? { |stones| stones.empty? }   
    end

    @cups[7..12].each do |cup| 
      return true if cup.all? { |stones| stones.empty? }
    end
    
    false
  end

  def winner
    first_player_score = @cups[6].count
    second_player_score = @cups[13].count 

    case first_player_score <=> second_player_score 
    when -1 
      @player_2
    when 1 
      @player_1
    when 0 
      :draw
    end
  end

end