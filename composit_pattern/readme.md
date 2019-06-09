# Composit Pattern
The composite design pattern is a structural pattern used to **represent objects that have a hierarchical tree structure**. It allows **for the uniform treatment of both individual leaf nodes and of branches composed of many nodes**.

## Composit Pattern Diagram :-
![Composit patter diagram](https://github.com/sateesh3048/ruby_design_patterns/blob/master/composit_pattern/composite_pattern.png)

## Creating Composites

To build the composite pattern we need three moving parts.

    1. A common interface or base class for all of your objects
    2. One or more leaf classes
    3. Ate least one higher-level class, called a composite class

### 1. A common interface:

When thinking about the design of a common interface, we should think *"what will my basic and higher-level objects all have in common?”* This is considered an interface or base class of the component.

Eg: Time measurement is common function for preparing cake between multiple classes.
1. time required for making batter
2. time required for baking
3. time required for packing

### 2. Leaf classes:

These are the simple, indivisible building blocks of the process. If we were making a pizza, you could consider each ingredient (i.e. cheese, tomato sauce and flour) as a simple enough division to be considered a building block. These indivisible leaf classes should implement the component interface. For instance, a higher level component could be ingredients, preparation, creation, packaging, and delivery.

### 3. Higher-Level Class:

We need at least one higher-level class, which will be considered the composite of the leaf classes we went over above. The composite is a component, but its also a higher-level object that is built from subcomponents in a manner consistent with the law of demeter. Worded a little differently, composites are just complex tasks made up of subtasks.    

## Example1:

We’ve been asked to build a system that keeps track of the manufacturing of cakes, being a key requirement being able to know how long it takes the task of baking it. Making a cake is a complicated process, as it involves multiple tasks that might be composed of different subtasks. The whole process could be represented in the following tree:

```
|__ Manufacture Cake
    |__ Make Cake
    |   |__ Make Batter
    |   |   |__ Add Dry Ingredients
    |   |   |__ Add Liquids
    |   |   |__ Mix
    |   |__ Fill Pan
    |   |__ Bake
    |   |__ Frost
    |
    |__ Package Cake
        |__ Box
        |__ Label
```

In the Composite pattern, we’ll model every step in a separate class with a common interface, which will report back how long they take. So we’ll define a common base class, Task, which plays the role of component.

```ruby
class Task
  attr_accessor :name, :parent  def initialize(name)
    @name = name
    @parent = nil
  end
  
  def get_time_required
    0.0
  end
end
```
  We can now create the classes in charge of the most basic jobs, this is, leaf classes, like AddDryIngredientsTask:

```ruby
class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end  def get_time_required
    1.0
  end
end
```

What we need now is a container to deal with complex tasks, which are internally built up of any number of subtasks, but from the outside look like any other Task. We’ll create the composite class:

```ruby
class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end
 
  def get_time_required
    @sub_tasks.inject(0.0) {|time, task| time += task.get_time_required}
  end
end
```

With this base class we can build complex tasks that behave like a simple one, as it implements the Task interface, and also add subtasks with the method add_sub_task. We’ll create the MakeBatterTask

```ruby
class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(AddLiquidsTask.new)
    add_sub_task(MixTask.new)
  end
end
```

We must keep in mind that the objects tree may go as deep as we want. MakeBatterTask contains only leaf objects, but we could create a class that contains composite objects and it would behave exactly the same:

```ruby
class MakeCakeTask < CompositeTask
  def initialize
    super('Make cake')
    add_sub_task(MakeBatterTask.new)
    add_sub_task(FillPanTask.new)
    add_sub_task(BakeTask.new)
    add_sub_task(FrostTask.new)
    add_sub_task(LickSpoonTask.new)
  end
end  
```

## Example 2: 

### Problem: 
We need to **caluculate how much money needed to pay salaries for entire employees** in company.
* Company can have multiple departments(eg: Production, Sales). 
* Each department can have multiple managers.
* Under each manager multiple employees can work.

### Solution: 
To solve this problem we can use composit pattern.
#### Why? :- 
1) Here **salary caluculation** is common across **company tree structure**. 
2) Here **Employees are leafs** or final nodes.
3) **Managers/Departments or composit nodes** with multiple leaf nodes.
4) Salary caluculation is common component across leaf/composit nodes.

### Code :-
```ruby
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
```
