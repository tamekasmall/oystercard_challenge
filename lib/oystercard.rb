class Oystercard

  attr_reader :balance #we want to gic ethe class oystercard the characteristict of having a balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance = @balance + amount
  end
end
