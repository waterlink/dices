require 'spec_helper'
require 'dices/simulation'

RSpec.describe Simulation do
  let!(:test_amount) { 10 }
  subject { Simulation.new test_amount }

  it 'creates without fail' do
    expect(subject).to be_truthy
  end

  it { is_expected.to respond_to(:run) }
  it { is_expected.to respond_to(:one_step) }

  describe '#one_step' do
    it 'rolls 10 dices' do
      expect_any_instance_of(Dice).to receive(:roll).exactly(10).times.and_return(4)
      subject.one_step
    end
  end

  describe '#run' do
    it 'runs one step amount of times' do
      expect(subject).to receive(:one_step).exactly(test_amount).times.and_return(45)
      subject.run
    end

    # @inner-check
    it 'collects data' do
      expect(subject).to receive(:one_step).exactly(test_amount).times.and_return(45, 25, 6, 6, 60, 35)
      subject.run

      sum_table = subject.instance_variable_get :@sum_table

      expect(sum_table[6]).to eq(2)
      expect(sum_table[25]).to eq(1)
      expect(sum_table[45]).to eq(1)
      expect(sum_table[35]).to eq(5)
      expect(sum_table[60]).to eq(1)
    end
  end
end

