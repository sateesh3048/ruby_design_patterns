class CPU
  
end

class BasicCPU < CPU
end

class TurboCPU < CPU
end

class Motherboard
  attr_accessor :cpu, :memory_size

  def initialize(cpu = BasicCPU.new, memory_size = 1024)
    @cpu = cpu
    @memory_size = memory_size
  end
end

class Drive
  attr_reader :type, :size, :writable

  def initialize(type, size, writable)
    @type = type
    @size = size
    @writable = writable
  end
end

class Computer
  attr_accessor :display, :motherboard
  attr_reader :drives

  def initialize(display = :crt, motherboard = Motherboard.new, drives = [])
    @motherboard = motherboard
    @drives = drives
    @display = display
  end
end

class ComputerBuilder
  attr_reader :computer

  def initialize
    @computer = Computer.new
  end

  def basic_cpu
    computer.motherboard.cpu = BasicCPU.new
  end

  def turbo_cpu
    computer.motherboard.cpu = TurboCPU.new
  end

  def display=(display)
    computer.display = display
  end

  def memory_size=(size_in_mb)
    computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writer = false)
    computer.drives << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer = false)
    computer.drives << Drive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end
end

builder = ComputerBuilder.new
builder.turbo_cpu
builder.add_hard_disk(1_000_000)
builder.memory_size = 16_000
builder.add_cd(true)
builder.add_dvd
computer = builder.computer

puts computer.inspect

#Result :-
#<Computer:0x00007f2b7c1a5550 @motherboard=#<Motherboard:0x00007f2b7c1a5460 @cpu=#<TurboCPU:0x00007f2b7c1a5258>, @memory_size=16000>, @drives=[#<Drive:0x00007f2b7c1a50f0 @type=:hard_disk, @size=1000000, @writable=true>, #<Drive:0x00007f2b7c1a5000 @type=:cd, @size=760, @writable=true>, #<Drive:0x00007f2b7c1a4f38 @type=:dvd, @size=4000, @writable=false>], @display=:crt>
