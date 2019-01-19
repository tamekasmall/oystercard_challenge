class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_AMOUNT = 1

  attr_reader :balance, :entry_station, :journey #we want to give the class oystercard the characteristict of having a balance

  def initialize(balance = 0)
    @balance = balance
    @entry_station = []
    @journey = []
  end

  def top_up(amount)
    raise "Balance exceeds maximum" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station != []
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(entry_station)
    raise "Error: not enough funds" if @balance < MINIMUM_AMOUNT
    @entry_station << entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_AMOUNT)
    @journey << { @entry_station.pop => exit_station }
  end

  private :deduct


end
