# Commands

class Account
  # Target
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def debit(amount)
    @balance -= amount
    puts "Account.debit:  amount=#{amount}, balance=#{@balance}"
  end

  def credit(amount)
    @balance += amount
    puts "Account.credit:  amount=#{amount}, balance=#{@balance}"
  end
end

class OrderCommand
  def initialize(price)
    @price = price
  end

  def execute
  end
end

class BuyOrder < OrderCommand
  def execute(account)
    puts 'BUY'
    account.debit @price
  end
end

class SellOrder < OrderCommand
  def execute(account)
    puts 'SELL'
    account.credit @price
  end
end

class Transaction
  # Command dispatcher
  def initialize(command)
    @command = command
  end

  def perform(on_account)
    @command.execute on_account
  end
end



account = Account.new(100)

Transaction.new( BuyOrder.new(20)).perform(account)
Transaction.new(SellOrder.new(10)).perform(account)

puts "Account.balance=#{account.balance}"
