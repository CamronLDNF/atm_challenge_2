require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5

  attr_reader :pin_code, :exp_date, :account_status
  attr_accessor :owner, :balance

  def initialize (attrs = {})
    @pin_code = rand(1000..9999)
    @exp_date = set_expire_date
    @account_status = :active
    @balance = 0
    @owner = set_owner(attrs[:owner])
  end

  def set_expire_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def deactivate
    @account_status = :disabled
  end

  private

  def set_owner(owner)
    owner == nil ? missing_owner : owner
  end

  def missing_owner
    raise 'An Account owner is required'
  end

end