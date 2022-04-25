require 'json'

class CsvFormatter
  def format(data)
    puts "\nWe are generating csv Report!"
    result = data.keys.join(',') + "\n"
    result += data.values.join(',') + "\n"
    p result
  end
end

class TsvFormatter
  def format(data)
    puts "\nWe are generating TSV Report!"
    result = data.keys.join("\t") + "\n"
    result += data.values.join("\t") + "\n"
    p result
  end
end

class JsonFormatter
  def format(data)
    puts "\nWe are generating json Report!"
    p data.to_json
  end
end

class Formatter
  # This is factory method
  def self.for(type)
    case type
    when 'csv'
      CsvFormatter.new
    when 'json'
      JsonFormatter.new
    when 'tsv'
      TsvFormatter.new
    else
      raise "\n\nPlease select correct type!"
    end
  end
end

# This is client facing api call.
# There wont be any change in this class.
# There will be new classes added for open/closed prinicple.
# Only in factory method we are going to add new case statement.
class ReportGenerator
  def self.generate(type, data)
    Formatter.for(type).format(data)
  end
end

data = { name: 'Harshini!', age: 16, address: 'Andhra Pradesh!' }
ReportGenerator.generate('csv', data)

ReportGenerator.generate('json', data)

ReportGenerator.generate('tsv', data)

ReportGenerator.generate('text', data)
