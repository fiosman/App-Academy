require_relative 'card.rb'
require "byebug"


class Board

  LETTERS = ("A".."Z").to_a.shuffle

  attr_accessor :deck_size, :deck

  def initialize(deck_size = 4)
    @deck_size = deck_size
    @deck = Array.new(@deck_size)
    populate_deck
  end

   def populate_deck 
     @deck.each_index do |idx| 
       @deck[idx] = Card.new(populate_letters[idx])
      end
      @deck
   end

   def populate_letters
    LETTERS.take(@deck_size/2) * 2
   end

  def render
   @deck.map do |card| 
    if card.face_up == false 
      card.hidden_value
    else
      card.revealed_value
    end
   end
  end

  def delete_pairs
    @deck.each_index do |card_index| 
      @deck.delete(@deck[card_index]) if @deck[card_index].face_up == true
    end
  end

  def reset
    @deck.each { |card| card.face_up = false }
    @deck.map { |card| card.hidden_value }
  end

end








