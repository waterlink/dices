module PlainFormatter
  def print_best_result
    puts "Best sum #{@best_sum} with #{@best_occurances} in #{@amount} runs"
  end

  def print_all_results
    puts "All results:"
    puts "| sum | occurances |"
    puts "| --- | ---------- |"
    @sum_table.map { |sum, occurances| [occurances, sum] }.sort.reverse.each do |row|
      puts "| #{row[1]} | #{row[0]} |"
    end
  end
end
