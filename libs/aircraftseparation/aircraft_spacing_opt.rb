class AircraftSpacingOpt
  def initialize(passengers)
    @passengers = passengers
    @sub_solution_i = sub_solution_i_plus_1 = sub_solution_i_plus_2 = 0
    for i in (@passengers.length - 1).downto(0)
      choosing_first = @passengers[i] + sub_solution_i_plus_2
      not_choosing_first = sub_solution_i_plus_1
      @sub_solution_i = [choosing_first, not_choosing_first].max
      sub_solution_i_plus_2 = sub_solution_i_plus_1
      sub_solution_i_plus_1 = @sub_solution_i
    end
  end

  def max_passengers
    @sub_solution_i
  end
end

spacing = AircraftSpacingOpt.new([155, 55, 2, 96, 67, 203, 3, 66, 32, 65, 29, 8, 299, 323, 77, 3, 28,
                                   128, 19, 523, 372, 2, 3, 66, 124, 38, 34, 12, 88, 23, 74, 65, 87, 434,
                                   14, 7, 49, 38, 27, 641, 61, 58, 14, 57, 71, 11, 82, 178, 93, 191, 4])
#spacing = AircraftSpacingOpt.new([155, 55, 2, 96, 67, 203, 3])
puts(spacing.max_passengers)
