class CountDerangementsTopDown
  def initialize(set_size)
    @set_size = set_size
    @sub_solutions = Array.new(set_size + 1, -1)
  end

  def count_derangements(i = @set_size)
    if @sub_solutions[i] != -1
      @sub_solutions[i]
    elsif i == 1
      0
    elsif i == 2
      1
    else
      n = (i - 1) * (count_derangements(i - 1) + count_derangements(i - 2))
      @sub_solutions[i] = n
      n
    end
  end
end

#for i in 1..64
for i in 1..10
  n = CountDerangementsTopDown.new(i).count_derangements
  puts("Derangments in set size %d -> %d" % [i, n])
end
