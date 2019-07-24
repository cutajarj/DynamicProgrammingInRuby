class CountDerangementsTopDown
  def initialize(set_size)
    @set_size = set_size
    @sub_solutions = Array.new(set_size + 1, -1)
  end

  def count_derangements(n = @set_size)
    if @sub_solutions[n] != -1
      @sub_solutions[n]
    elsif n == 1
      0
    elsif n == 2
      1
    else
      result = (n - 1) * (count_derangements(n - 1) + count_derangements(n - 2))
      @sub_solutions[n] = result
      result
    end
  end
end

#for i in 1..64
for i in 1..10
  n = CountDerangementsTopDown.new(i).count_derangements
  puts("Derangments in set size %d -> %d" % [i, n])
end
