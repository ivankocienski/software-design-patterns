# Prototype

class Map
  attr_accessor :home

  def initialize(home)
    @home = home
    puts 'Map is expensive to build'
  end

  def lookup(destination)
    puts "lookup: #{home}->#{destination}"
  end
end

#
# demonstration
#

# original object
map = Map.new('london')
map.lookup('new-york')

# use map object as template
map2 = map.dup
map.lookup('chicago')

# another 
map3 = map.dup
map.lookup('san-francisco')
