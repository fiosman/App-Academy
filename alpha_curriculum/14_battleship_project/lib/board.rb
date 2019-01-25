
require 'byebug'

class Board

  attr_reader :grid, :size

  def self.print_grid(grid) 
    grid.each do |row| 
      puts row.join(" ")
    end
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n**2 
  end

  def [](arr_position)
    row = arr_position[0]
    col = arr_position[1]
    @grid[row][col]
  end

  def []=(position, val)
    row = position[0]
    col = position[1]
    @grid[row][col] = val
  end

  def num_ships
    count = 0  
    @grid.each do |row| 
      row.each_index do |col|
        count+= 1 if row[col] === :S
      end
    end
    count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts 'you sunk my battleship'
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25
    while self.num_ships < total_ships 
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      pos = [rand_row, rand_col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row| 
      row.map do |ele| 
        if ele == :S 
          ele = :N
        else
          ele
        end 
      end
    end
  end

  def cheat 
    Board.print_grid(@grid)
  end

  def print 
    Board.print_grid(self.hidden_ships_grid)
  end
  
end

