require 'Oystercard'

describe Oystercard do

  let (:station) {double :station}

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to( :top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up Oystercard::MINIMUM_AMOUNT }.to change{ subject.balance }.by Oystercard::MINIMUM_AMOUNT
    end
  end

  it 'raises an error if top up exceeds limit' do
    expect{ subject.top_up(Oystercard::MAXIMUM_BALANCE + 1) }.to raise_error "Balance exceeds maximum"
  end

  describe '#touch_in' do
    it 'tells us if touched in' do
      subject.instance_variable_set(:@balance, Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it "raises error when card with insufficient balance is touched in" do
      expect { subject.touch_in(station) }.to raise_error("Error: not enough funds")
    end
  end

  it "checks if card is in use" do
    subject.top_up(Oystercard::MINIMUM_AMOUNT)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it "to check that a charge is made on touch out" do
    subject.top_up(Oystercard::MINIMUM_AMOUNT)
    subject.touch_in(station)
    expect { subject.touch_out(station) }.to change{ subject.balance }.by( -Oystercard::MINIMUM_AMOUNT)
  end

  it "check that when the card is touched out, it's no longer in journey" do
    subject.top_up(Oystercard::MINIMUM_AMOUNT)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.in_journey?).to eq false
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journey).to be_empty
  end

  context 'station' do
    it "stores the entry and exit station, when touched in and touched out" do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.journey).to include({ station => station })
    end
  end
end
# Write a test to check if error is thrown when card with insufficient balance is touched in
