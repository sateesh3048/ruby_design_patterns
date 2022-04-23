The intent of Chain of Responsibility pattern is to decouple the sender of a request from its receiver by giving more than one object a chance to handle the request.

## What is Chain of responsibility design pattern?

The Chain Of Responsibility pattern enables you to loosely couple the senders and receivers of a request. 
We build **a receiver objects chain** in this pattern, with **each receiver containing a reference to next receiver**. 
This chain receives a request from the client and starts processing it. 
If **first object is unable to handle the request**, it is **passed to the next receiver**, and so on, until the request is fully handled.


During the run time, the **objects in the chain will decide** who will handle the request and whether it needs to be passed on to the next object 
in the chain. The Chain of responsibility design pattern is classified as a **behavioural pattern**.

Example :-

A common example of this pattern is event bubbling in DOM. An event propagates through different nested elements of the DOM 
until one of them handles it.

Let us say when user clicked on Save "Button" on UI.  
1. Then button event handler will be called if it is defined.
2. if there is no button handler, Then button will forward the request to its parent i.e form.
3. if there is no form handler, then form will forward the request to its parent i.e document
4. if there is no document handler, then document will forward the request to its parent i.d window.
5. if there is no window handler, then window handler will execute default action from else block.

  ![image](https://user-images.githubusercontent.com/1171883/164885703-b6b1e64f-e345-4b88-ae50-814abb1804eb.png)
