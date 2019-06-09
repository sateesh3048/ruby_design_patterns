#Basic componenet
class Task
  attr_accessor :name, :parent
  
  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end 

class AddDryIngredients < Task
  def initialize()
    super("Add Dry Ingredients")
  end

  def get_time_required
    1.0
  end
end

class AddLiquids < Task
  def initialize()
    super("Add Liquids")
  end

  def get_time_required
    0.5
  end
end

class MixIngredients < Task
  def initialize()
    super("Mix Dry and Liquid Ingredients")
  end

  def get_time_required
    2.5
  end
end

class FillPan < Task
  def initialize()
    super("Filling Pan with Ingredients")
  end

  def get_time_required
    5.0
  end
end

class Bake < Task
  def initialize()
    super("Baking to make cake")
  end

  def get_time_required
    20
  end
end

class Frost < Task
  def initialize()
    super("Frosting the cake")
  end

  def get_time_required
    60
  end
end

class Box < Task
  def initialize()
    super("Packing the cake in box")
  end

  def get_time_required
    5
  end
end

class Label < Task
  def initialize()
    super("Adding wishes for customer")
  end

  def get_time_required
    4
  end
end

class CompositTask < Task

  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each do |task|
      time += task.get_time_required
    end
    puts "Task Name: #{name}"
    puts "Task manufacturing time: #{time}"
    time
  end
end

class MakeBatter < CompositTask
  def initialize
    super("Making Batter")
    add_sub_task(AddDryIngredients.new)
    add_sub_task(AddLiquids.new)
    add_sub_task(MixIngredients.new)
  end
end

class MakeCake < CompositTask
  def initialize
    super("Making Cake")
    add_sub_task(MakeBatter.new)
    add_sub_task(FillPan.new)
    add_sub_task(Bake.new)
    add_sub_task(Frost.new)
  end
end

class PackingCake < CompositTask
  def initialize
    super("Packing Cake")
    add_sub_task(Box.new)
    add_sub_task(Label.new)
  end
end

class ManufacturingCake < CompositTask
  def initialize(name)
    super(name)
    add_sub_task(MakeCake.new)
    add_sub_task(PackingCake.new)
  end
end

m = ManufacturingCake.new("pan cake")
puts m.get_time_required