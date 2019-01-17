class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_AMOUNT = 1

  attr_reader :balance, :entry_station, :exit_station #we want to give the class oystercard the characteristict of having a balance

  def initialize(balance = 0, entry_station = nil, exit_station = nil)
    @balance = balance
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def top_up(amount)
    raise "Balance exceeds maximum" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@entry_station #the first ! changes the return to be true /false, but this is the opposite to what we need so another ! is used.
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    raise "Error: not enough funds" if @balance < MINIMUM_AMOUNT
    @entry_station = station

  end

  def touch_out(station)
    deduct(MINIMUM_AMOUNT)
    @entry_station = nil
    @exit_station = station

  end

  private :deduct


end
