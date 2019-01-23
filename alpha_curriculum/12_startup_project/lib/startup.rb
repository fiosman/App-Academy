require_relative "./employee.rb"
#name (string), funding (number), and salaries (hash) containing `title` => `salary`
class Startup

  attr_reader :name, :salaries, :employees
  attr_accessor :funding

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding 
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def > (start_up) 
    self.funding > start_up.funding
  end

  def hire(name, title)
    if self.valid_title?(title)
      @employees.push(Employee.new(name, title))
    else
      raise 'No opening for that position'
    end
  end

  def size 
    @employees.count
  end

  def pay_employee(employee)
    position_salary = @salaries[employee.title]
    if @funding > position_salary
      employee.pay(position_salary)
      @funding -= position_salary
    else
      raise 'Not enough money'
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee)}
  end

  def average_salary
    employee_salaries = []
    @employees.each do |employee|
      if @salaries.keys.include?(employee.title)
        employee_salaries << @salaries[employee.title]
      end
    end
    employee_salaries.reduce(&:+)/employee_salaries.length
  end

  def close 
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding 
    startup.salaries.each do |title, salary| 
      if !@salaries.has_key?(title)
        @salaries[title] = salary
      end
    end
    @employees += startup.employees
    startup.close 
  end
end



