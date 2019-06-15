class StringDistanceBottomUp
  def initialize(str_A, str_B)
    @str_A = str_A
    @str_B = str_B
    @dist1 = Array.new(@str_B.length + 1, -1)
    @dist2 = Array.new(@str_B.length + 1, -1)
    for a in 0..@str_A.length
      for b in 0..@str_B.length
        if a == 0
          @dist2[b] = b
        elsif b == 0
          @dist2[b] = a
        else
          replace_cost = @str_A[a - 1] == @str_B[b - 1] ? 0 : 1
          cost_delete = @dist1[b] + 1
          cost_insert = @dist2[b - 1] + 1
          cost_replace = @dist1[b - 1] + replace_cost
          @dist2[b] = [cost_delete, cost_insert, cost_replace].min
        end
      end
      puts(@dist2.join(","))
      temp = @dist1
      @dist1 = @dist2
      @dist2 = temp
    end
  end

  def distance()
    @dist1[@str_B.length]
  end
end

#sDist = StringDistanceBottomUp.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceBottomUp.new("Saturday", "Sundays")
puts(sDist.distance)

