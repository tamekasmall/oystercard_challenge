require 'Oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to( :top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end
end

  it 'raises an error if top up exceeds limit' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up(1) }.to raise_error "Balance exceeds maximum"
  end

  describe '#deduct' do
    it { is_expected.to respond_to( :deduct).with(1).argument }

    it 'can deduct a fare from the balance' do
      expect{ subject.deduct(1) }.to change { subject.balance }.by -1
    end
  end

  it { is_expected.to respond_to( :in_journey?)}

  describe '#in_journey' do
    it 'tells us if in journey' do
      expect(subject.in_journey?).to eq(true)
    end
  end

  it { is_expected.to respond_to( :touch_in)}

  describe '#touch_in' do
    it 'tells us if touched in' do
      expect(subject.touch_in).to eq(true)
    end
  end

  it { is_expected.to respond_to( :touch_out)}

  describe '#in_journey' do
    it 'tells us if touched out' do
      expect(subject.touch_out).to eq(true)
    end
  end

  it "checks if card is in use" do
    subject.touch_in
    expect(subject.in_use).to eq(true)
  end
end
