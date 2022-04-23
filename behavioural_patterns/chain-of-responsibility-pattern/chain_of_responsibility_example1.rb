class MathOperations
  attr_reader :num1, :num2, :operation, :next_handler

  def initialize(next_handler)
    @next_handler = next_handler
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

class Addition < MathOperations
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

class Subtraction < MathOperations
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

class Multiplication < MathOperations
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

class Division < MathOperations
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

obj = Addition.new(
  Subtraction.new(
    Multiplication.new(
      Division.new(nil)
    )
  )
)

req1 = { num1: 10, num2: 5, operation: 'addition' }
obj.handler(req1)

req2 = { num1: 10, num2: 5, operation: 'subtraction' }
obj.handler(req2)

req3 = { num1: 10, num2: 5, operation: 'multiplication' }
obj.handler(req3)

req4 = { num1: 10, num2: 5, operation: 'division' }
obj.handler(req4)

req5 = { num1: 10, num2: 5, operation: 'square' }
obj.handler(req5)
