class AircraftSpacingTopDown
  def initialize(passengers)
    @passengers = passengers
    @sub_solutions = Array.new(passengers.length, -1)
  end

  def max_passengers(i)
    if i >= @passengers.length
      0
    elsif @sub_solutions[i] != -1
      @sub_solutions[i]
    else
      choosing_fist = @passengers[i] + max_passengers(i + 2)
      not_choosing_fist = max_passengers(i + 1)
      max_pass = [choosing_fist, not_choosing_fist].max
      @sub_solutions[i] = max_pass
      max_pass
    end
  end
end

#spacing = AircraftSpacingTopDown.new([155, 55, 2, 96, 67, 203, 3, 66, 32, 65, 29, 8, 299, 323, 77, 3, 28,
#                                   128, 19, 523, 372, 2, 3, 66, 124, 38, 34, 12, 88, 23, 74, 65, 87, 434,
#                                   14, 7, 49, 38, 27, 641, 61, 58, 14, 57, 71, 11, 82, 178, 93, 191, 4])
spacing = AircraftSpacingTopDown.new([155, 55, 2, 96, 67, 203, 3])
puts(spacing.max_passengers(0))
