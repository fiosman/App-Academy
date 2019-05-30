class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name 
    @title = title 
    @salary = salary
    @boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_emp(self) unless boss.nil? 
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  def initialize(name, title, salary, boss)
    super 
    @employees = []
  end
  
  def add_emp(employee) 
    @employees << employee
  end
end

