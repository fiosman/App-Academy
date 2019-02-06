require_relative 'card.rb'

class Board

  LETTERS = ("A".."Z").to_a.shuffle

  attr_accessor :deck, :letters_grid

  def initialize(deck_size = 10)
    @deck = Array.new(deck_size)
    @letters_grid = Array.new(deck_size)
    populate_deck
  end

  def populate_deck 
    @deck.each_index do |idx| 
      @deck[idx] = Card.new(populate_letters[idx])
      @letters_grid[idx] = idx
    end
  end

  def populate_letters
    LETTERS.take(@deck.count/2) * 2
  end

  def render
   @deck.map { |card| card.value? }
  end

  def delete_pairs
    @deck.each_index do |card_index| 
      if @deck[card_index].face_up 
         @deck.delete(@deck[card_index]) 
         @letters_grid = @letters_grid.take(@letters_grid.count - 1)
      end
    end
  end

  def reset
    @deck.each { |card| card.hide }
  end

  def clear
    system('clear')
    puts self.render.join(" ")
    puts self.letters_grid.join(" ")
    puts "\n"
  end

end