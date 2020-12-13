require 'pry'
require_relative 'bank_account.rb'

class Transfer
  

  attr_accessor :sender, :receiver, :amount, :status, :balance
  attr_reader :name

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @count = 1
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def bad_transaction
    if !self.valid?
      self.status = "rejected"
    end
    return "Transaction rejected. Please check your account balance."
  end

  def good_transaction
    if self.valid?
    while @count > 0 do
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      @count -= 1
    end
    end
  end  

  def execute_transaction
    self.good_transaction || self.bad_transaction
  end

  def reverse_transfer
    if self.status == "complete"
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount    
    self.status = "reversed"
    end
  end

end


marty = BankAccount.new("Marty")
evan = BankAccount.new("Evan")
transfer = Transfer.new(marty, evan, 1500)

