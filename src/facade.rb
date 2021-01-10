# Facade

# Our complex library with many parts
class Request
  def initialize(url, parameters)
    @url = url
    @parameters = parameters
  end
end

class Response
  def initialize(method, request)
    @request = request
    @method = method
  end

  def status
    200
  end

  def headers
    { method: @method,
      content_type: 'text/html',
      modified: '01/01/1970',
      length: 1000
    }
  end

  def body
    "This is the document body"
  end
end

class URL
  def initialize(url)
    @url = url
  end

  def url
    @url
  end
end

class WebInteraction
  attr_reader :request
  attr_reader :response

  def initialize(url, parameters={})
    @request = Request.new(url, parameters)
  end

  def do_get
    @response = Response.new(:get, request)
  end

  def do_post
    @response = Response.new(:post, request)
  end

  def was_200?
    response.status == 200
  end
end

# Our simplified API
class GetPage
  def initialize(url_string)
    @url_string = url_string
  end

  def get
    url = URL.new(@url_string)
    web_interaction = WebInteraction.new(url)
    web_interaction.do_get

    response = web_interaction.response

    yield response.status, response.headers, response.body
  end
end

#
# demonstration
#

# the verbose API
puts 'Using the API directly'
url = URL.new('http://example.com:8080')
web_interaction = WebInteraction.new(url)
web_interaction.do_get
# web_interaction.do_post # (can be more flexible)

if web_interaction.was_200?
  puts "  status=#{web_interaction.response.status}"
  puts "  headers=#{web_interaction.response.headers}"
  puts "  body=#{web_interaction.response.body}"
end


# The simpler facade API
puts "\nUsing the Facade helper class"
GetPage.new('http://example.com:8080').get do |status, headers, body|
  puts "  status=#{status}"
  puts "  headers=#{headers}"
  puts "  body=#{body}"
end

