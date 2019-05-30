require 'byebug'

class Employee
  attr_accessor :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss)
    @name = name 
    @title = title 
    @salary = salary
    self.boss = boss
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
  attr_reader :employees 

  def initialize(name, title, salary, boss)
    super 
    @employees = []
  end
  
  def add_emp(employee) 
    @employees << employee
  end

  def sub_employees
    #byebug
    children = []

    queue = self.employees

    until queue.empty? 
      current_employee = queue.shift 
      children << current_employee
      if current_employee.is_a?(Manager)
        queue += current_employee.employees
      end
    end

    children
  end

  def bonus(multiplier)
    sub_employees.map(&:salary).inject(:+) * multiplier
  end

end
