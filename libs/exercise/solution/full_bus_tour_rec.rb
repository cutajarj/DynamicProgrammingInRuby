class FullBusTour
  def initialize(group_sizes, full_cap)
    @group_sizes = group_sizes
    @full_cap = full_cap
  end

  def fits_exactly(length = @group_sizes.length, c = @full_cap)
    if c == 0
      true
    elsif length == 0
      false
    else
      capacity_remaining = c - @group_sizes[length - 1]
      fits_exactly(length - 1, c) or (capacity_remaining >= 0 and fits_exactly(length - 1, capacity_remaining))
    end
  end
end