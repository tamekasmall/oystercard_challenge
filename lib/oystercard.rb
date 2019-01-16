class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance, :in_use #we want to give the class oystercard the characteristict of having a balance

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "Balance exceeds maximum" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    true
  end

  def touch_in
    true
  end

  def touch_out
    true
  end
end
