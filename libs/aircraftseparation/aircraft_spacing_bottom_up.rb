class AircraftSpacingBottomUp
  def initialize(passengers)
    @passengers = passengers
    @sub_solutions = Array.new(passengers.length, -1)
    for i in (@passengers.length - 1).downto(0)
      choosing_first = passengers[i] + (i + 2 < @sub_solutions.length ? @sub_solutions[i + 2] : 0)
      not_choosing_first = i + 1 < @sub_solutions.length ? @sub_solutions[i + 1] : 0
      @sub_solutions[i] = [choosing_first, not_choosing_first].max
    end
  end

  def max_passengers()
    @sub_solutions[0]
  end
end

#spacing = AircraftSpacingBottomUp.new([155, 55, 2, 96, 67, 203, 3, 66, 32, 65, 29, 8, 299, 323, 77, 3, 28,
#                                   128, 19, 523, 372, 2, 3, 66, 124, 38, 34, 12, 88, 23, 74, 65, 87, 434,
#                                   14, 7, 49, 38, 27, 641, 61, 58, 14, 57, 71, 11, 82, 178, 93, 191, 4])
spacing = AircraftSpacingBottomUp.new([155, 55, 2, 96, 67, 203, 3])
puts(spacing.max_passengers)
