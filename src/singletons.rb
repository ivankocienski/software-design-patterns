# Singletons

# as a class
class SingletonClass

  def initialize
    # our internal state to abstract away
    @count = 0
    puts 'The singleton is created'
  end

  def bark
    @count += 1
    puts "[#{@count}] bark bark"
  end

  def self.get
    # we have only one instance of this
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
  extend self

  def bark
    # the utility we wish to provide upstream
    set_count count + 1
    puts "[#{count}] bark bark"
  end

  private

  def set_count(value)
    # updating our resource is hidden away from the end-user
    @count = value
  end

  def count
    # get our shared resource or initialize it
    @count || 0
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
