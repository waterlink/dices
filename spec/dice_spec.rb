require 'spec_helper'
require 'dices/dice'

RSpec.describe Dice do
  it { is_expected.to respond_to(:roll) }

  it 'rolls a number' do
    expect(subject.roll.is_a? Integer).to be_truthy
  end

  it 'rolls a number between 1 and 6' do
    100.times { expect(subject.roll).to be_between(1, 6) }
  end
end

