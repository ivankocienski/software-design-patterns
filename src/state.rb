# State

class State
  attr_reader :context

  def initialize(context)
    @context = context
  end

  def parse_line(line)
  end
end

class PreambleState < State
  def parse_line(line)
    context.preamble = line.split /\s+/
    context.set_state :header
  end
end

class HeaderState < State
  def parse_line(line)
    line = line.strip
    if line.empty?
      context.set_state :body

    else
      if line =~ /^([^:]+):(.*)/
        context.headers[$1] = $2
      else
        context.set_state :failure
      end
    end
  end
end

class BodyState < State
  def parse_line(line)
    context.body += line
  end
end

class FailureState < State
end

class HTTPParser
  STATE_TABLE = {
    preamble: PreambleState,
    header: HeaderState,
    body: BodyState,
    failure: FailureState
  }.freeze

  attr_reader :state_name
  attr_accessor :preamble
  attr_accessor :headers
  attr_accessor :body

  def initialize
    set_state :preamble

    @preamble = ''
    @headers = {}
    @body = ''

    yield self if block_given?
  end

  def valid_response?
    @state_name != :failure
  end

  def set_state(new_state)
    state_class = STATE_TABLE[new_state]
    @state = state_class.new(self)
    @state_name = new_state
  end

  def parse_line(input)
    # deligate parsing duties to state handler
    @state.parse_line input
  end
end

###

def report(title, response)
  puts '-' * 20
  puts "#{title}\n"

  if response.valid_response?
    puts 'VALID RESPONSE'
  else
    puts 'INVALID RESPONSE'
  end

  puts response.preamble.join(', ')
  puts response.headers
  puts response.body
end


response = HTTPParser.new do |parser|
  parser.parse_line "HTTP/1.1 200 OK\r\n"
  parser.parse_line "Date: Mon, 23 May 2005 22:38:34 GMT\r\n"
  parser.parse_line "Content-Type: text/html; charset=UTF-8\r\n"
  parser.parse_line "Content-Length: 155\r\n"
  parser.parse_line "\r\n"
  parser.parse_line "<html>\r\n"
  parser.parse_line "  <head>\r\n"
  parser.parse_line "    <title>An Example Page</title>\r\n"
  parser.parse_line "  </head>\r\n"
  parser.parse_line "  <body>\r\n"
  parser.parse_line "    <p>Hello World, this is a very simple HTML document.</p>\r\n"
  parser.parse_line "  </body>\r\n"
  parser.parse_line "</html>\r\n"
  parser.parse_line "\r\n"
end

report 'Parsing a well formed response', response

###

response = HTTPParser.new do |parser|
  parser.parse_line "HTTP/1.1 200 OK\r\n"
  parser.parse_line "Date: Mon, 23 May 2005 22:38:34 GMT\r\n"
  parser.parse_line "This line is a badly formed header\r\n"
  parser.parse_line "Content-Length: 155\r\n"
  parser.parse_line "\r\n"
  parser.parse_line "<html>\r\n"
  parser.parse_line "  <head>\r\n"
  parser.parse_line "    <title>This will never be parsed</title>\r\n"
  parser.parse_line "  </head>\r\n"
  parser.parse_line "  <body>\r\n"
  parser.parse_line "    <p>You won't see this</p>\r\n"
  parser.parse_line "  </body>\r\n"
  parser.parse_line "</html>\r\n"
  parser.parse_line "\r\n"
end

report 'Parsing a badly formed response', response
