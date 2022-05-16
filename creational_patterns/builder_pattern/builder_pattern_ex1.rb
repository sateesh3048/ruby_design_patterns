class BankAccount
  attr_accessor :account_no, :owner, :branch, :balance, :interest_rate
end


class BankAccountBuilder
  attr_accessor :bank_account

  def initialize
    @bank_account = BankAccount.new
  end

  def with_account_no(account_no)
    @bank_account.account_no = account_no
    self
  end

  def with_owner(owner)
    @bank_account.owner = owner
    self
  end

  def at_branch(branch)
    @bank_account.branch = branch
    self
  end

  def opening_balance(balance)
    @bank_account.balance = balance
    self
  end

  def at_rate(interest_rate)
    @bank_account.interest_rate = interest_rate
    self
  end

  def self.build
    bank_account_builder = new
    yield(bank_account_builder) if block_given?
    bank_account_builder.bank_account
  end
end

bank_account1 = BankAccountBuilder.build do |bank_account_builder|
  bank_account_builder.with_account_no('2345')
  bank_account_builder.with_owner('Sai Ram')
  bank_account_builder.at_branch('Chennai')
  bank_account_builder.opening_balance(1000)
  bank_account_builder.at_rate(10)
end

puts bank_account1.inspect
