class MaxSubArrayOpt
  def initialize(prices)
    @prices = prices
    @global_max = 0
    local_max = 0
    for i in 0..@prices.length - 1
      local_max = if i == 0
                    @prices[0]
                  else
                    [@prices[i], local_max + @prices[i]].max
                  end
      @global_max = [@global_max, local_max].max
    end
  end

  def max_sub_array()
    @global_max
  end
end

msa = MaxSubArrayOpt.new([5, -4, 8, -10, -2, 4, -3, 2, 7, -8, 3, -5, 3])
puts(msa.max_sub_array)

# input = [1] * 10000
# for i in 0..9
#   msa = MaxSubArrayOpt.new(input)
#   puts(msa.max_sub_array)
# end
