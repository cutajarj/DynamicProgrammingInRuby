class StringDistanceTopDown
  def initialize(str_A, str_B)
    @str_A = str_A
    @str_B = str_B
    @dist = Array.new(@str_A.length + 1) {Array.new(@str_B.length + 1, -1)}
  end

  def distance(a = @str_A.length, b = @str_B.length)
    case
    when @dist[a][b] != -1
      @dist[a][b]
    when a == 0
      b
    when b == 0
      a
    else
      replace_cost = @str_A[a - 1] == @str_B[b - 1] ? 0 : 1

      cost_delete = distance(a - 1, b) + 1
      cost_insert = distance(a, b - 1) + 1
      cost_replace = distance(a - 1, b - 1) + replace_cost
      minCost = [cost_delete, cost_insert, cost_replace].min
      @dist[a][b] = minCost
      minCost
    end
  end
end

#sDist = StringDistanceTopDown.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceTopDown.new("Saturday", "Sundays")
puts(sDist.distance)

