require 'pry'
require_relative 'bank_account.rb'

class Transfer
  
  @@count = 1

  attr_accessor :sender, :receiver, :amount, :status, :balance
  attr_reader :name

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
        @@count -= 1
        
      end
 
end


marty = BankAccount.new("Marty")
evan = BankAccount.new("Evan")
transfer = Transfer.new(marty, evan, 500)

#binding.pry