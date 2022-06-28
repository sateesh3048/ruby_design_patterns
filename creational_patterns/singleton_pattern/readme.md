# Singleton Pattern:

Singleton is a creational design pattern **that restricts instantiation of a class to only one instance** that is globally available. 
It is useful when you need **that instance to be accessible in different parts of the application, usually for logging 
functionality, communication with external systems, database access**, for accessing application settings etc.


Example:-

```
require 'singleton'
class Logger
  include Singleton
  def initialize
    puts 'I am in initialize!'
    @log_file = File.open('log.txt', 'a')
  end

  def write(msg)
    @log_file.puts("************#{msg}****************")
  end

  def read
    File.readlines(@log_file).each do |line|
      puts line.inspect
    end
  end
end

```

```
@logger_singleton_obj = Logger.instance
@logger_singleton_obj.write('Error message')
@logger_singleton_obj.write('Another message')
puts @logger_singleton_obj.object_id
@logger_singleton_obj.read
```
