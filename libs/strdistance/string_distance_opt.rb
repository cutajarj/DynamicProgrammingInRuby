class StringDistanceBottomUp
  def initialize(str_A, str_B)
    @str_A = str_A
    @str_B = str_B
    @dist_read = Array.new(@str_B.length + 1, -1)
    @dist_write = Array.new(@str_B.length + 1, -1)
    for a in 0..@str_A.length
      for b in 0..@str_B.length
        if a == 0
          @dist_write[b] = b
        elsif b == 0
          @dist_write[b] = a
        else
          replace_cost = @str_A[a - 1] == @str_B[b - 1] ? 0 : 1
          cost_delete = @dist_read[b] + 1
          cost_insert = @dist_write[b - 1] + 1
          cost_replace = @dist_read[b - 1] + replace_cost
          @dist_write[b] = [cost_delete, cost_insert, cost_replace].min
        end
      end
      puts(@dist_write.join(","))
      temp = @dist_read
      @dist_read = @dist_write
      @dist_write = temp
    end
  end

  def distance()
    @dist_read[@str_B.length]
  end
end

#sDist = StringDistanceBottomUp.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceBottomUp.new("Saturday", "Sundays")
puts(sDist.distance)

