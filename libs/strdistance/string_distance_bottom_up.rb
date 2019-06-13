class StringDistanceBottomUp
  def initialize(str_A, str_B)
    @str_A = str_A
    @str_B = str_B
    @dist = Array.new(@str_A.length + 1) {Array.new(@str_B.length + 1, -1)}
    for a in 0..@str_A.length
      for b in 0..@str_B.length
        if a == 0
          @dist[a][b] = b
        elsif b == 0
          @dist[a][b] = a
        else
          replace_cost = @str_A[a - 1] == @str_B[b - 1] ? 0 : 1
          cost_delete = @dist[a - 1][b] + 1
          cost_insert = @dist[a][b - 1] + 1
          cost_replace = @dist[a - 1][b - 1] + replace_cost
          @dist[a][b] = [cost_delete, cost_insert, cost_replace].min
        end
      end
    end
  end

  def distance()
    @dist[@str_A.length][@str_B.length]
  end
end

#sDist = StringDistanceBottomUp.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceBottomUp.new("Saturday", "Sundays")
puts(sDist.distance)

