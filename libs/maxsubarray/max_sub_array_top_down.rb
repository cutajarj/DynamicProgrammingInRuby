class MaxSubArrayTopDown
  def initialize(prices)
    @prices = prices
    @sub_problems = Array.new(prices.length, nil)
  end

  def max_sub_array()
    max_value = 0
    for j in 0..@prices.length - 1
      max_value = [max_value, max_sub_array_ending_at(j)].max
    end
    max_value
  end

  def max_sub_array_ending_at(i)
    if @sub_problems[i] != nil
      @sub_problems[i]
    elsif i == 0
      @prices[0]
    else
      m = [@prices[i], max_sub_array_ending_at(i - 1) + @prices[i]].max
      @sub_problems[i] = m
      m
    end
  end

end

msa = MaxSubArrayTopDown.new([5, -4, 8, -10, -2, 4, -3, 2, 7, -8, 3, -5, 3])
puts(msa.max_sub_array)

# input = [1] * 10000
# for i in 0..9
#   msa = MaxSubArrayTopDown.new(input)
#   puts(msa.max_sub_array)
# end
