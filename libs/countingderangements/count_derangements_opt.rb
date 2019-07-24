class CountDerangementsOpt
  def initialize(set_size)
    @set_size = set_size
    @solution_n = solution_n_minus_1 = solution_n_minus_2 = 0
    for n in 1..@set_size
      if n == 1
        @solution_n = 0
      elsif n == 2
        @solution_n = 1
      else
        @solution_n = (n - 1) * (solution_n_minus_1 + solution_n_minus_2)
      end
      solution_n_minus_2 = solution_n_minus_1
      solution_n_minus_1 = @solution_n
    end
  end

  def count_derangements
    @solution_n
  end
end

# for i in 1..64
for i in 1..10
  n = CountDerangementsOpt.new(i).count_derangements
  puts("Derangments in set size %d -> %d" % [i, n])
end
