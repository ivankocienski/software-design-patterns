# Adapter

# sources

class RadioSource
  def initialize(frequency)
    @frequency = frequency
  end

  def tune_to_channel
    puts "Tune to channel #{@frequency}"
  end

  def listen
    puts 'Listenning to channel'
  end
end

class StreamingSource
  def initialize(url)
    @url = url
  end

  def select_url
    puts "Select url #{@url}"
  end

  def make_connection
    puts "Making connection"
  end

  def stream_audio
    puts "Streaming audio"
  end
end

# adapters
class AbstractAdapter
  attr_reader :base_object

  def initialize(base_object)
    @base_object = base_object
  end
end

class RadioAdapter < AbstractAdapter
  def play
    base_object.tune_to_channel
    base_object.listen
  end            
end

class StreamingAdapter < AbstractAdapter
  def play
    base_object.select_url
    base_object.make_connection
    base_object.stream_audio
  end            
end

# consumer class

class MediaPlayer
  # this class just wants to play the media
  def play_media(media)
    media.play
  end
end

#
# demonstration
#

media_player = MediaPlayer.new

puts 'Playing radio'
media_player.play_media(
  RadioAdapter.new(
    RadioSource.new(1234)))

puts 'Playing streamer source'
media_player.play_media(
  StreamingAdapter.new(
    StreamingSource.new('http://radio.net')))
