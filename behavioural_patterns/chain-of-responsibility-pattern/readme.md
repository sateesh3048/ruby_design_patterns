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


**Example Programs :-**


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
