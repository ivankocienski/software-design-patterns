# Decorator

class Pet
  # a basic class
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    puts "#{name} says hello"
  end
end

class Decorator
  attr_reader :parent

  def initialize(parent)
    @parent = parent
  end

  def self.decorate(object)
    new object
  end
end

class CatBehaviour < Decorator
  def speak
    puts "I am a cat"
    parent.speak
  end
end

class CuriousBehaviour < Decorator
  def speak
    puts "I am curious"
    parent.speak
  end
end

#
# demonstration
#

puts '# pet1: A pet'
pet1 = Pet.new('Fred')
pet1.speak

puts "\n# pet2: A cat pet"
pet2 = CatBehaviour.decorate(pet1)
pet2.speak

puts "\n# pet3: A curiuos cat"
pet3 = CuriousBehaviour.decorate(pet2)
pet3.speak

puts "\n# pet1: Original pet is untouched"
pet1.speak

pet1.name = 'Fluffy'
puts "\n# pet3: the parent Pet can be modified and all decorated objects reflect that modification"
pet3.speak
