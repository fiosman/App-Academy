require_relative 'card.rb'

class Board

  LETTERS = ("A".."Z").to_a.shuffle

  attr_accessor :deck

  def initialize(deck_size=10)
    @deck = Array.new(deck_size)
    populate_deck
  end

  def populate_deck 
    @deck.each_index do |idx| 
      @deck[idx] = Card.new(populate_letters[idx], idx)
    end
    self.shuffle_deck
  end

  def populate_letters
    LETTERS.take(@deck.count/2) * 2
  end

  def shuffle_deck 
    @deck.shuffle!
  end

  def render
    @deck.map { |card| card.value? }
  end

  def delete_pairs
    @deck.each do |card| 
      if card.face_up
         @deck.delete(card) 
      end
    end
  end

  def select_card(player_input)
    @deck.select { |card| card.hidden_value == player_input }
  end

  def get_card_pos(card)
     @deck.find_index(select_card(card).first)
  end

  def reset
    @deck.each { |card| card.hide }
  end
  
  def clear
    system('clear')
    puts self.render.join(" || ")
    puts "\n"
  end

  def clear_v2 
    render.each do |ele| 
      puts ele
    end
  end

  def display_grid 
    @deck.map { |card| card.hidden_value }
  end

end


