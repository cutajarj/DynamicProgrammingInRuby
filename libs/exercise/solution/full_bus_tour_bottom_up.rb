class FullBusTour
  def initialize(group_sizes, full_cap)
    @group_sizes = group_sizes
    @full_cap = full_cap
    @sub_solutions = Array.new(group_sizes.length + 1) { Array.new(full_cap + 1, nil) }
    for length in 0..group_sizes.length
      for c in 0..full_cap
        if c == 0
          @sub_solutions[length][c] = true
        elsif length == 0
          @sub_solutions[length][c] = false
        else
          capacity_remaining = c - @group_sizes[length - 1]
          @sub_solutions[length][c] = (@sub_solutions[length - 1][c] or
              (capacity_remaining >= 0 and @sub_solutions[length - 1][capacity_remaining]))
        end
      end
    end
  end

  def fits_exactly(length = @group_sizes.length, c = @full_cap)
    @sub_solutions[@group_sizes.length][@full_cap]
  end
end