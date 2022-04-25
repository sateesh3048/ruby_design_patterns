
# Template Method Design Pattern

Template Method Pattern is a behavioral design pattern. 

Template method **defines the steps required to execute an algorithm** and it's class can provide default implementation for all common methods across all or some of the subclasses.

The Template Method allows you **to define the "skeleton" of an algorithm** by defining **common methods in parent class**/super class/abstract class , 
while leaving **concrete/specific (i.e distinct behavior) implementation up to inheriting classes/child classes**/sub classes. 
The template (in this case, the parent class) serves as an **outline of the steps needed** to complete the task, itself implementing any steps that 
don’t vary and defining, It’s concrete-class children then go on to implement those missing steps.

## Example :

Let’s understand this pattern with an example, suppose we want to provide an algorithm to build a house. The steps need to be performed to build a
house are – 
1. building foundation, 
2. building pillars, 
3. building roofs
4. building walls 
5. and windows. 

The important point is that the we can’t change the order of execution because we can’t build windows before building the foundation. So in this 
case we can create a template method that will use different methods to build the house.

Now building the foundation for a house is same for all type of houses, whether its a wooden house or a glass house. So we can provide base 
implementation for this, if subclasses want to override this method, they can but mostly it’s common for all the types of houses.
To **make sure that subclasses don’t override the template method, we should make it final**.

## Template Method Class Diagram
![Template Method Pattern Diagram](/behavioural_patterns/template_method_pattern/template-method-pattern.png)

## Template Method Pattern Example Demo :-



```ruby
#House is an abstract class.

#Common Methods :-
# In this class we have defined build_foundation, build_roof, build_windows as Non Varying / common methods.
class House

#build_house is the template method. In this method we have defined the sequence of steps required to build house.
#Note: Since this is template method, we should not override this method in sub classes.
def build_house
    build_foundation
    build_pillars
    build_roof
    build_walls
    build_windows
    puts 'Congratulations!!. Your house is ready to use!'
  end

  def build_foundation
    puts 'House foundation completed!'
  end

  def build_roof
    puts 'House Roof completed!'
  end

  def build_windows
    puts 'Building windows completed!'
  end
end
```

In below class we are creating wooden house class to build wodden house.
In this class we have defined Varying methods/distinct methods such as build_walls, build_pillars.
```ruby
class WoodenHouse < House
  def build_walls
    puts 'Building wooden walls'
  end

  def build_pillars
    puts 'Building pillars with wooden coating!'
  end
end
```
We are defining glass house class  to build glass house.
In this class we have defined Varying methods such as build_walls, build_pillars.

```ruby
class GlassHouse < House
  def build_walls
    puts 'Building glass walls'
  end

  def build_pillars
    puts 'Building pillars with glass coating!'
  end
end
```
We are calling wooden house and glass house to build wooden and glass houses.

```ruby
puts '********** Building wooden house *************'
wooden_house = WoodenHouse.new
wooden_house.build_house

puts "\n\n Building glass house *****************"
glass_house = GlassHouse.new
glass_house.build_house

```

## Template Method Design Pattern Important Points

1. Template method should consists of certain steps whose order is fixed and for some of the methods, implementation differs from base class to subclass. **Template method should be final.**
2. Most of the times, subclasses calls methods from super class **but in template pattern, superclass template method calls methods from subclasses, this is known as Hollywood Principle** – **don’t call us, we’ll call you.**.
3. Methods in base class with default implementation are referred as Hooks and they are intended to be overridden by subclasses, if you want some of the methods to be not overridden, you can make them final, for example in our case we can make buildFoundation() method final because if we don’t want subclasses to override it.
