class AircraftSpacingRec
  def initialize(passengers)
    @passengers = passengers
  end

  def max_passengers(i)
    if i >= @passengers.length
      0
    else
      choosing_fist = @passengers[i] + max_passengers(i + 2)
      not_choosing_fist = max_passengers(i + 1)
      [choosing_fist, not_choosing_fist].max
    end
  end
end

#spacing = AircraftSpacingRec.new([155, 55, 2, 96, 67, 203, 3, 66, 32, 65, 29, 8, 299, 323, 77, 3, 28,
#                                   128, 19, 523, 372, 2, 3, 66, 124, 38, 34, 12, 88, 23, 74, 65, 87, 434,
#                                   14, 7, 49, 38, 27, 641, 61, 58, 14, 57, 71, 11, 82, 178, 93, 191, 4])
spacing = AircraftSpacingRec.new([155, 55, 2, 96, 67, 203, 3])
puts(spacing.max_passengers(0))
