
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
3. building walls 
4. and windows. 
The important point is that the we can’t change the order of execution because we can’t build windows before building the foundation. So in this 
case we can create a template method that will use different methods to build the house.

Now building the foundation for a house is same for all type of houses, whether its a wooden house or a glass house. So we can provide base 
implementation for this, if subclasses want to override this method, they can but mostly it’s common for all the types of houses.
To **make sure that subclasses don’t override the template method, we should make it final**.


