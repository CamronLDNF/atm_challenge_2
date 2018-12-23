require './lib/account.rb'

class Person

  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
    @account == nil ? missing_account : deposit_funds(amount) 
  end

  def withdraw(args = {})
    args[:atm] ? withdraw_funds(args) : missing_atm
  end

  private

    def set_name(name)
      name == nil ? missing_name : name
    end

    def missing_name
      raise 'A name is required'
    end
    
    def deposit_funds(amount)
      @cash -= amount
      @account.balance += amount
    end
    
    def missing_account
      raise 'No account present'
    end

    def withdraw_funds(args)
      amount = args[:amount]
      @account.balance -= amount
      @cash += amount  
    end

    def missing_atm
      raise 'An ATM is required'
    end

end