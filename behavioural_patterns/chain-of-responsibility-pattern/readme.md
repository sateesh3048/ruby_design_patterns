The intent of Chain of Responsibility pattern is to **decouple the sender of a request from its receiver** by giving more than one object a chance to handle the request.

## What is Chain of responsibility design pattern?

The Chain Of Responsibility pattern enables you to loosely couple the senders and receivers of a request. 
We build **a receiver objects chain** in this pattern, with **each receiver containing a reference to next receiver**. 
This chain receives a request from the client and starts processing it. 
If **first object is unable to handle the request**, it is **passed to the next receiver**, and so on, until the request is fully handled.


During the run time, the **objects in the chain will decide** who will handle the request and whether it needs to be passed on to the next object 
in the chain. The Chain of responsibility design pattern is classified as a **behavioural pattern**.

**Example :-**

A common example of this pattern is event bubbling in DOM. An event propagates through different nested elements of the DOM 
until one of them handles it.

Let us say when user clicked on Save "Button" on UI.  
1. Then button event handler will be called if it is defined.
2. if there is no button handler, Then button will forward the request to its parent i.e form.
3. if there is no form handler, then form will forward the request to its parent i.e document
4. if there is no document handler, then document will forward the request to its parent i.d window.
5. if there is no window handler, then window handler will execute default action from else block.
![Chain of Responsibility patter diagram](/behavioural_patterns/chain-of-responsibility-pattern/chain_of_responsibility.png)

**UML Diagram:-**

![Uml diagram](/behavioural_patterns/chain-of-responsibility-pattern/Design_Chain_of_Responsibility_Design_Pattern_UML.jpg)


**Example Programs 1 :-**

User gives you two numbers and operation(i.e addition/subtraction/multiplication/division).
So you are going to define 4 handlers 
1. AdditionHandler
2. SubtractionHandler
3. MultiplicationHandler
4. DivisionHandler

You are going to create objects for these 4 handlers and add them as chain of objects.

if User enters "multiplication" operation then
request first goes to addition handler (can not handl request so forward it) -> subtraction handler (can not handl request so forward it) -> multiplication handler(operation handled here)

**Defining Abstract Hadler :-**

AbstractHandler is defined with common abstract methods. 

```
class MathOperations
  attr_reader :num1, :num2, :operation, :next_handler

  def initialize
    raise 'This is an abstract class.So you cant create objects!'
  end

  def handler(_req)
    raise 'handler method must be implemented by subclass!'
  end

  def can_handle?(_req)
    raise 'can_handle method must be implemented by subclass!'
  end

  def caluculate(_req)
    raise 'caluculate method must be implemented by subclass!'
  end

  def params_initialization(req)
    @num1 = req[:num1]
    @num2 = req[:num2]
    @operation = req[:operation]
  end
end
```
**Defining AdditionHandler:-**

AdditionHandler is definied to support additions.

```
class AdditionHandler < MathOperations
  def initialize(next_handler)
    @next_handler = next_handler
  end

  def handler(req)
    if can_handle?(req)
      caluculate(req)
    else
      next_handler.handler(req)
    end
  end

  private

  def can_handle?(req)
    req[:operation] == 'addition'
  end

  def caluculate(req)
    params_initialization(req)
    res = num1 + num2
    puts "Sum of two numbers #{num1} + #{num2} = #{res}"
  end
end
```
**Defining SubtractionHandler:-**

SubtractionHandler is definied to support subtractions.

```
class SubtractionHandler < MathOperations
  def initialize(next_handler)
    @next_handler = next_handler
  end

  def handler(req)
    if can_handle?(req)
      caluculate(req)
    else
      next_handler.handler(req)
    end
  end

  private

  def can_handle?(req)
    req[:operation] == 'subtraction'
  end

  def caluculate(req)
    params_initialization(req)
    res = num1 - num2
    puts "Subtraction of two numbers #{num1} - #{num2} = #{res}"
  end
end
```
**Defining MultiplicationHandler:-**

MultiplicationHandler is definied to support multiplications.

```
class MultiplicationHandler < MathOperations
  def initialize(next_handler)
    @next_handler = next_handler
  end

  def handler(req)
    if can_handle?(req)
      caluculate(req)
    else
      next_handler.handler(req)
    end
  end

  private

  def can_handle?(req)
    req[:operation] == 'multiplication'
  end

  def caluculate(req)
    params_initialization(req)
    res = num1 * num2
    puts "Multiplication of two numbers #{num1} * #{num2} = #{res}"
  end
end
```
**Defining DivisionHandler:-**

DivisionHandler is definied to support divisions.

```
class DivisionHandler < MathOperations
  def initialize(next_handler)
    @next_handler = next_handler
  end

  def handler(req)
    if can_handle?(req)
      caluculate(req)
    else
      puts "Given operation #{req[:operation]} is not supported!. Kindly please contact tech support team."
    end
  end

  private

  def can_handle?(req)
    req[:operation] == 'division'
  end

  def caluculate(req)
    params_initialization(req)
    res = num1 / num2
    puts "Division of two numbers #{num1} / #{num2} = #{res}"
  end
end
```
**Calling Handlers :-**

```
obj = AdditionHandler.new(
  SubtractionHandler.new(
    MultiplicationHandler.new(
      DivisionHandler.new(nil)
    )
  )
)

req1 = { num1: 10, num2: 5, operation: 'addition' }
obj.handler(req1) #Result: Sum of two numbers 10 + 5 = 15

req2 = { num1: 10, num2: 5, operation: 'subtraction' }
obj.handler(req2) #Result: Subtraction of two numbers 10 - 5 = 5

req3 = { num1: 10, num2: 5, operation: 'multiplication' }
obj.handler(req3) #Result: Multiplication of two numbers 10 * 5 = 50 

req4 = { num1: 10, num2: 5, operation: 'division' }
obj.handler(req4) #Result: Division of two numbers 10 / 5 = 2

req5 = { num1: 10, num2: 5, operation: 'square' }
obj.handler(req5) #Result: Given operation square is not supported!. Kindly please contact tech support team.
```


**Example Programs 2 :-**

Please click this file [chain_of_responsibility_pattern_example2.rb](/behavioural_patterns/chain-of-responsibility-pattern/chain_of_responsibility_pattern_example2.rb) to view second example.


### Advantage of Chain Of Responsibility pattern.

1. The code is more maintainable because it is less coupled between the object and the other object handles a request. 
The object (sender) only needs to know that a request will be handled by the handler. That is **to say that both (receiver and the sender) have no explicit knowledge of each other. Besides, the object in the chain doesn’t need to know about the chain’s structure.**

2. Clean code. The Open-Closed Principle (OCP) is guaranteed since new handlers can be introduced without breaking the existing code in the chain.

3. Cleaner code. The Single Responsibility Principle (SRP) is respected since the responsibility of each handler is transferred to its handle method instead of having that business logic in the client code.


### When to use Chain Of Responsibility pattern?

1. When you wish to separate the sender and receiver of a request.
2. When multiple objects need to handle the request.
3. When you don’t want to declare each handler in your code directly.

### Drawbacks 
Finally, the main drawback of the chain of responsibility pattern — like most design patterns — is that there’s an increase in code complexity and the number of classes required for the code. 
With that said, this disadvantage is well known when applying design patterns — **it’s the price to pay for gaining abstraction in the code.**
