class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance #we want to gic ethe class oystercard the characteristict of having a balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance exceeds maximum" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount

  end
end
