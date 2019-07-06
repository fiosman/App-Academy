require 'active_support/inflector'

class Dessert
  attr_reader :type, :quantity, :ingredients, :temp

  def initialize(type, quantity, chef)
    raise ArgumentError unless quantity.is_a?(Integer)
    @type = type
    @quantity = quantity
    @chef = chef
    @ingredients = []
    @temp = 60
  end

  def add_ingredient(ingredient)
    @ingredients << ingredient
  end

  def mix!
    @ingredients.shuffle!
  end

  def heat!
    @temp = 400
  end

  def eat(amount)
    raise "not enough left!" if @quantity - amount < 0
    @quantity -= amount
  end

  def serve
    "#{@chef.titleize} has made #{@quantity} #{@type.pluralize}!"
  end

  def make_more
    @chef.bake(self)
  end
end
