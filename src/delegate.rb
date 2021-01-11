# Delegate

class BankAccount
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def deposit(value)
    @balance += value
  end
end

class User
  def initialize
    @bank_account = BankAccount.new(123)
  end

  def balance
    @bank_account.balance
  end

  def deposit(value)
    @bank_account.deposit value
  end
end

#
# demonstration
#

user = User.new
puts "User balance: #{user.balance}"
user.deposit 100
puts "User balance: #{user.balance}"

