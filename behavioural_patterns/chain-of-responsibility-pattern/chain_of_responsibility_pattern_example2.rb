# client send us message typ i.e "xml msg/json msg/ text msg/ swift msg"
# and respect msg.
# Now we need to define handlers to handle these message types.
# Based on message type handler will handle these messages.
class Parser
  attr_reader :successor

  def next_handler(handler)
    @successor = handler
  end
end

class XmlParser < Parser
  def call(request)
    return successor.call(request) unless can_handle?(request)

    handle(request)
  end

  private

  def handle(_request)
    puts 'I am Xml message Parser. I am processing xml message!'
  end

  def can_handle?(request)
    request[:message_type] == 'xml'
  end
end

class JsonParser < Parser
  def call(request)
    return successor.call(request) unless can_handle?(request)

    handle(request)
  end

  private

  def handle(_request)
    puts 'I am Json Message Parser. I am processing Json message!'
  end

  def can_handle?(request)
    request[:message_type] == 'json'
  end
end

class SwiftParser < Parser
  def call(request)
    return successor.call(request) unless can_handle?(request)

    handle(request)
  end

  private

  def handle(_request)
    puts 'I am Swift Message Parser. I am processing swift message!'
  end

  def can_handle?(request)
    request[:message_type] == 'swift'
  end
end

class TextParser < Parser
  def call(request)
    if can_handle?(request)
      handle(request)
    else
      puts "Invalid #{request[:message_type]} Handler. Kindly please contact tech support team"
    end
  end

  private

  def handle(_request)
    puts 'I am Text Msg Parser. I am processing text message!'
  end

  def can_handle?(request)
    request[:message_type] == 'text'
  end
end

# Defining Parsers
xml_parser = XmlParser.new
json_parser = JsonParser.new
text_parser = TextParser.new
swift_parser = SwiftParser.new

# Defining next set of handlers.
xml_parser.next_handler(json_parser)
json_parser.next_handler(swift_parser)
swift_parser.next_handler(text_parser)

req1 = { message_type: 'xml', msg: '<xml><name>hello</name></xml>' }
xml_parser.call(req1)

req2 = { message_type: 'json', msg: '{name: "Hello"}' }
xml_parser.call(req2)

req3 = { message_type: 'swift', msg: '{{block1:"Hello"}}' }
xml_parser.call(req3)

req4 = { message_type: 'text', msg: 'namehello' }
xml_parser.call(req4)

req5 = { message_type: 'invalid', msg: '<xml><name>hello</name></xml>' }
xml_parser.call(req5)
