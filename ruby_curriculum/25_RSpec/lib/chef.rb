class Chef
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def titleize
    "Chef #{@name} the Great Baker"
  end

  def bake(dessert)
    dessert.mix!
    put_in_oven(dessert)
  end

  private
  def put_in_oven(dessert)
    dessert.heat!
  end
end
