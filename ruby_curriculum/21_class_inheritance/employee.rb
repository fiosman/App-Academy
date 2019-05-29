class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name 
    @title = title 
    @salary = salary
    @boss = boss.upcase
  end

end

class Manager < Employee
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end
  
end

#manager_1 = Manager.new('f', 't', 'h', 'g')
#p manager_1.name
