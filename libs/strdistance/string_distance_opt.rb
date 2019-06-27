class StringDistanceOpt
  def initialize(str_a, str_b)
    @str_a = str_a
    @str_b = str_b
    @dist_read = Array.new(@str_b.length + 1, -1)
    @dist_write = Array.new(@str_b.length + 1, -1)
    for a in 0..@str_a.length
      for b in 0..@str_b.length
        if a == 0
          @dist_write[b] = b
        elsif b == 0
          @dist_write[b] = a
        else
          replace_cost = @str_a[a - 1] == @str_b[b - 1] ? 0 : 1
          cost_delete = @dist_read[b] + 1
          cost_insert = @dist_write[b - 1] + 1
          cost_replace = @dist_read[b - 1] + replace_cost
          @dist_write[b] = [cost_delete, cost_insert, cost_replace].min
        end
      end
      temp = @dist_read
      @dist_read = @dist_write
      @dist_write = temp
      puts(@dist_read.join(","))
    end
  end

  def distance()
    @dist_read[@str_b.length]
  end
end

#sDist = StringDistanceOpt.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceOpt.new("Saturday", "Sundays")
puts(sDist.distance)

