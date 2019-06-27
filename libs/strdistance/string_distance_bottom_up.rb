class StringDistanceBottomUp
  def initialize(str_a, str_b)
    @str_a = str_a
    @str_b = str_b
    @dist = Array.new(@str_a.length + 1) {Array.new(@str_b.length + 1, -1)}
    for a in 0..@str_a.length
      for b in 0..@str_b.length
        if a == 0
          @dist[a][b] = b
        elsif b == 0
          @dist[a][b] = a
        else
          replace_cost = @str_a[a - 1] == @str_b[b - 1] ? 0 : 1
          cost_delete = @dist[a - 1][b] + 1
          cost_insert = @dist[a][b - 1] + 1
          cost_replace = @dist[a - 1][b - 1] + replace_cost
          @dist[a][b] = [cost_delete, cost_insert, cost_replace].min
        end
      end
      puts(@dist[a].join(","))
    end
  end

  def distance()
    @dist[@str_a.length][@str_b.length]
  end
end

#sDist = StringDistanceBottomUp.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceBottomUp.new("Saturday", "Sundays")
puts(sDist.distance)

