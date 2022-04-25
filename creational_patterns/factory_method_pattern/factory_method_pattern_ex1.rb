class Shape
  def draw
    raise NotImplementedError
  end
end

class Square < Shape
  def draw
    puts "\n\nI am drawing Square.\n"
  end
end

class Rectangle < Shape
  def draw
    puts "\nI am drawing Rectangle.\n"
  end
end

class Circle < Shape
  def draw
    puts "\nI am drawing Circle.\n"
  end
end

class Formatter
  def self.for(type)
    case type
    when 'square'
      Square.new
    when 'rectangle'
      Rectangle.new
    when 'circle'
      Circle.new
    else
      raise "\n\n Invalid type. Please contact tech support team."
    end
  end
end

class ShapeGenerator
  def self.generate(type)
    Formatter.for(type).draw
  end
end

ShapeGenerator.generate('circle')
ShapeGenerator.generate('rectangle')
ShapeGenerator.generate('square')
ShapeGenerator.generate('Triangle')
