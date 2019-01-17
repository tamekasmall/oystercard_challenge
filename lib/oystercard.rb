class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_AMOUNT = 1

  attr_reader :balance, :in_use #we want to give the class oystercard the characteristict of having a balance

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance exceeds maximum" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Error: not enough funds" if @balance < MINIMUM_AMOUNT

    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_AMOUNT)
  end

  private :deduct


end
