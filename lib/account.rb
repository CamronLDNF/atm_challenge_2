require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5

  # attr_accessor :pin_code
  attr_reader :pin_code, :exp_date, :account_status

  def initialize
    @pin_code = rand(1000..9999)
    @exp_date = set_expire_date
    @account_status = :active
  end

  def set_expire_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def deactivate
    @account_status = :disabled
  end

end