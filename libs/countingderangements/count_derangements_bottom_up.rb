class CountDerangementsBottomUp
  def initialize(set_size)
    @set_size = set_size
    @sub_solutions = Array.new(set_size + 1)
    for i in 1..set_size
      if i == 1
        @sub_solutions[i] = 0
      elsif i == 2
        @sub_solutions[i] = 1
      else
        @sub_solutions[i] = (i - 1) * (@sub_solutions[i - 1] + @sub_solutions[i - 2])
        end
    end
  end

  def count_derangements()
    @sub_solutions[@set_size]
  end
end

#for i in 1..64
for i in 1..10
  n = CountDerangementsBottomUp.new(i).count_derangements
  puts("Derangments in set size %d -> %d" % [i, n])
end
