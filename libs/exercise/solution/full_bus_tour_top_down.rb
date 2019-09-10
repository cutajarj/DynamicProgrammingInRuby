class FullBusTour
  def initialize(group_sizes, full_cap)
    @group_sizes = group_sizes
    @full_cap = full_cap
    @sub_solutions = Array.new(group_sizes.length + 1) { Array.new(full_cap + 1, nil) }
  end

  def fits_exactly(length = @group_sizes.length, c = @full_cap)
    if c == 0
      true
    elsif length == 0
      false
    elsif @sub_solutions[length][c] != nil
      @sub_solutions[length][c]
    else
      capacity_remaining = c - @group_sizes[length - 1]
      result = (fits_exactly(length - 1, c) or (capacity_remaining >= 0 and fits_exactly(length - 1, capacity_remaining)))
      @sub_solutions[length][c] = result
      result
    end
  end
end
