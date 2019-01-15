class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance #we want to gic ethe class oystercard the characteristict of having a balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Top up exceeds maximum" if exceed_limit?
  end
end

private

  def exceed_limit?
    top_up(amount) +n @balance > MAXIMUM_BALANCE
      @balance += top_up(amount)
  end
