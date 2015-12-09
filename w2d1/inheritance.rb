class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary = name, title, salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?
  end

  def add_to_managers_employees(boss)
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    subordinate_salary_sum * multiplier
  end

  def add_employee(employee)
    @employees << employee
  end

  protected
  def subordinate_salary_sum
    sum = 0
    @employees.each do |employee|
      sum += employee.salary
      sum += employee.subordinate_salary_sum if employee.is_a?(Manager)
    end
    sum
  end
end
