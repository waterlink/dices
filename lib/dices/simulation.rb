require 'active_support/core_ext/enumerable'
require './lib/dices/dice'

class Simulation
  DICES_COUNT = 10

  def initialize(amount)
    @amount = amount
    @sum_table = {}
    @best_sum = nil
    @best_occurances = -1
  end

  def run
    @amount.times { add_one_occurence_of one_step }
  end

  def one_step
    dice = Dice.new
    (1..DICES_COUNT).map { dice.roll }.sum
  end

  private

  def add_one_occurence_of(sum)
    @sum_table[sum] ||= 0
    @sum_table[sum] += 1
    if @sum_table[sum] > @best_occurances
      @best_sum = sum
      @best_occurances = @sum_table[sum]
    end
  end
end
