# Builder Pattern

The Builder pattern is a **creational pattern**.

Builder pattern help us to **Separate the construction of a complex object from its representation** so that the same 
construction process can create different representations.

### Problem :-

Let us say we need to build a sofware for creating bank account for client.

```
class BankAccount
  attr_accessor :account_no, :owner, :balance

  def initialize(account_no, owner, balance)
    @account_no = account_no
    @owner = owner
    @balance = balance
  end
end
```
This is reasonably straightforward — we can use it as follows.
```
bank_account = BankAccount.new(1234, 'Hanuma', 100.00)
puts bank_account.inspect => #<BankAccount:0x00007fbdd74a8b10 @account_no=1234, @owner="Hanuma", @balance=100.0>
```
Unfortunately, solutions rarely stay simple. A new requirement arrives that says that we should keep track of the 
monthly interest rate applicable to each account, the date on which it was opened, and, optionally, the branch at 
which it was opened. It sounds easy enough, so we come up with version 2.0 of the BankAccount class.

```
class BankAccount
  attr_accessor :account_no, :owner, :branch, :balance, :interest_rate

  def initialize(account_no, owner, branch, balance, interest_rate)
    @account_no = account_no
    @owner = owner
    @branch = branch
    @balance = balance
    @interest_rate = interest_rate
  end
end

```
Thanks to our new and improved account handling process, we get some new clients.

```
bank_account1 = BankAccount.new(1234, 'Hanuma', 'Chennai', 100.00, 10)

///oops balance and interest_rate params got swapped. now interest rate is 1000%
bank_account2 = BankAccount.new(5678, 'Rama', 'Chennai', 10.00, 1000) 

puts bank_account1.inspect => #<BankAccount:0x00007f85ceab46d0 @account_no=1234, @owner="Hanuma", @branch="Chennai", @balance=100.0, @interest_rate=10>
puts bank_account2.inspect => #<BankAccount:0x00007f85ceab4568 @account_no=5678, @owner="Rama", @branch="Chennai", @balance=10.0, @interest_rate=1000>

```

If we have multiple consecutive arguments of the same type, it's **easy to accidentally swap them around**.'
and that can turn into a tricky debugging exercise. In addition, **adding more constructor parameters results in code that becomes harder to read** . 
If we had 10 different parameters, it would become **very difficult to identify what's what in the constructor at a single glance**. 
To **make it worse, some of those values might be optional**, which means that we'll need to create a bunch of overloaded constructors to deal with all possible combinations, or we'll have to pass nulls to our constructor (ugly!).


You might be thinking that we can mitigate the issue by calling a no-arg constructor and then setting up the account 
via setter methods instead. However, that leaves us open to another issue – what happens if a developer forgets to 
call a particular setter method? We could end up with an object that is only partially initialized, and again, the 
compiler wouldn't see any problems with it.

Thus, there are two specific problems that we need to solve:

1. **Too many constructor arguments.**
2. **Incorrect object state.**

This is where the Builder pattern comes into play.

# Builder Pattern

The Builder pattern allows us to **write readable, understandable code to set up complex objects**. 
We are going to define **a new builder class** which help us in building complex objects by removing the constructor from the main class.

Builder class Example :-

```
class BankAccount
  attr_accessor :account_no, :owner, :branch, :balance, :interest_rate
end
```

```
class BankAccountBuilder
  attr_accessor :bank_account

  def initialize
    @bank_account = BankAccount.new
  end

  def with_account_no(account_no)
    @bank_account.account_no = account_no
    self
  end

  def with_owner(owner)
    @bank_account.owner = owner
    self
  end

  def at_branch(branch)
    @bank_account.branch = branch
    self
  end

  def opening_balance(balance)
    @bank_account.balance = balance
    self
  end

  def at_rate(interest_rate)
    @bank_account.interest_rate = interest_rate
    self
  end

  def self.build
    bank_account_builder = new
    yield(bank_account_builder) if block_given?
    bank_account_builder.bank_account
  end
end

```
We can now create new accounts as follows.

```
bank_account1 = BankAccountBuilder.build do |bank_account_builder|
  bank_account_builder.with_account_no('2345')
  bank_account_builder.with_owner('Sai Ram')
  bank_account_builder.at_branch('Chennai')
  bank_account_builder.opening_balance(1000)
  bank_account_builder.at_rate(10)
end

puts bank_account1.inspect

```

We can also create account like this also

```
bank_account2 = BankAccountBuilder.new
                                  .with_account_no(6789)
                                  .with_owner('Siva')
                                  .at_branch('Chennai')
                                  .opening_balance(5000)
                                  .at_rate(9)
                                  .account

puts bank_account2.inspect
```

Is this code more verbose? Yes. Is it clearer? Yes. Is it better? Since a large chunk of our time is spent reading code rather than writing it, I'm pretty sure it is, yes.

### Summary

We worked through an example where code started out simple, and then grew in complexity. 
We then used the **Builder pattern to address the issues that we uncovered**.

If you find yourself in **a situation where you keep on adding new parameters to a constructor, 
resulting in code that becomes error-prone and hard to read, perhaps it's a good time to take a step back 
and consider refactoring your code to use a Builder.**


