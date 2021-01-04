# Singletons

# as a class
class SingletonClass

  def initialize
    @count = 0
    puts 'The singleton is created'
  end

  def bark
    @count += 1
    puts "[#{@count}] bark bark"
  end

  def self.get
    @singleton ||= new
  end
end

puts '-' * 80
puts 'Singleton as a class'

puts 'Calling into singleton'
SingletonClass.get.bark

puts 'Using singleton again'
SingletonClass.get.bark

puts 'Using again'
SingletonClass.get.bark




# as a module
module SingletonModule
  module_function

  def bark
    @count ||= 0
    @count += 1 
    puts "[#{@count}] bark bark"
  end
end

puts '-' * 80
puts 'Singleton as a module'

puts 'Calling into singleton'
SingletonModule.bark

puts 'Using singleton again'
SingletonModule.bark

puts 'Using again'
SingletonModule.bark
