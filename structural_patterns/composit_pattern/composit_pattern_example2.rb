=begin
  Problem: Caluculate how much salary we need to pay monthly for employees in company.
  
  To solve this problem we can use composit patter as explained below.

  Solution : Each company will have a tree structure with many departments and under each 
  department can have many employees. 
  So using composit patterns we are solving this problem.
  
=end

module ResourceList
  def initialize(name, salary=0.0, division="employee")
    @name = name
    @salary = salary
    @division = division
    @resources = []
  end

  def add_resource(resource)
    @resources << resource
  end

  def remove_resource(resource)
    @resource.delete(resource)
  end

  def salaries_need_to_pay_per_month
    result = @resources.inject(@salary) do |salaries, resource|
      salaries += resource.salaries_need_to_pay_per_month
    end
  end
end

class Employee
  include ResourceList
  def initialize(name, salary=0.0, role="employee")
    super(name, salary, "employee")
    @role = role
  end
end


class Deparment
  include ResourceList
  def initialize(name)
    super(name, 0.0, "department")
  end
end

class Company
  include ResourceList
  def initialize(name)
    super(name, 0.0, "company")
  end
end


e1 = Employee.new("Ram", 25)
e2 = Employee.new("Sita", 15)
e3 = Employee.new("Lakshman", 10)
e4 = Employee.new("Hanuman", 10)
e5 = Employee.new("Ravan", 25)
e7 = Employee.new("Shyam", 25)
e10 = Employee.new("Mohan", 10)

manager1 = Employee.new("Raghu", 50, "manager")
manager1.add_resource(e1)
manager1.add_resource(e3)

manager2 = Employee.new("Kiran", 40, "manager")
manager2.add_resource(e5)
manager2.add_resource(e7)

manager3 = Employee.new("Murthy", 35, "manager")
manager3.add_resource(e10)

manager4 = Employee.new("Ranagan", 45, "manager")
manager4.add_resource(e2)
manager4.add_resource(e4)

d1 = Deparment.new("Production")
d1.add_resource(manager1)
d1.add_resource(manager3)
d1.add_resource(manager4)

d2 = Deparment.new("Sales")
d2.add_resource(manager2)

c = Company.new("GoodBiscuts")
c.add_resource(d1)
c.add_resource(d2)


# Retrieving data is very easy under this model.
# We can also calaculate salaries required under department very easily
# puts d1.salaries_need_to_pay_per_month
# puts d2.salaries_need_to_pay_per_month

#We can also get salaries required under each manager
# puts manager2.salaries_need_to_pay_per_month
# puts manager4.salaries_need_to_pay_per_month

#Adding new layers are also very easy.
#Now I am adding some team leads under manager

e11 = Employee.new("Jain", 11)
e12 = Employee.new("Mukesh", 14)
@team_lead1 = Employee.new("Akash", 35, "lead")
@team_lead1.add_resource(e11)
@team_lead1.add_resource(e12)

manager1.add_resource(@team_lead1)

puts c.salaries_need_to_pay_per_month
