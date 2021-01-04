# proxies

class Lock
  # the complex class we wish to augment
  def open_lock
    puts 'Lock is oppening'
  end
end

class User
  # a parameter object 
  def initialize(key_value = nil)
    @key_value = key_value
  end

  def has_gold_key?
    @key_value == :gold
  end
end

class Crypto
  # the proxy class that controls access to the lock

  def initialize(user)
    @user = user
    @lock = Lock.new
  end

  def open_lock
    if @user.has_gold_key?

      # pass control to dependent
      @lock.open_lock

    else
      puts 'User does not have correct key'
    end
  end
end

# proxy wont allow lock to open with incorrect key
puts 'Trying with blue key'
Crypto.new(User.new(:blue)).open_lock

# proxy will allow lock to open with correct key
puts 'Trying with gold key'
Crypto.new(User.new(:gold)).open_lock

