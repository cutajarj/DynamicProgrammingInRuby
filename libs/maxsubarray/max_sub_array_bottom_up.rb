class MaxSubArrayBottomUp
  def initialize(prices)
    @prices = prices
    @sub_solutions = Array.new(prices.length)
    for i in 0..prices.length - 1
      @sub_solutions[i] = if i == 0
                            @prices[0]
                          else
                            [@prices[i], @sub_solutions[i - 1] + @prices[i]].max
                          end
    end
  end

  def max_sub_array()
    max_value = 0
    for j in 0..@prices.length - 1
      max_value = [max_value, @sub_solutions[j]].max
    end
    max_value
  end
end

msa = MaxSubArrayBottomUp.new([5, -4, 8, -10, -2, 4, -3, 2, 7, -8, 3, -5, 3])
puts(msa.max_sub_array)

# input = [1] * 10000
# for i in 0..9
#   msa = MaxSubArrayBottomUp.new(input)
#   puts(msa.max_sub_array)
# end
