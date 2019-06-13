class StringDistanceTopDown
  def initialize(strA, strB)
    @strA = strA
    @strB = strB
    @dist = Array.new(@strA.length + 1) {Array.new(@strB.length + 1, -1)}
  end

  def distance(a = @strA.length, b = @strB.length)
    case
    when @dist[a][b] != -1
      @dist[a][b]
    when a == 0
      b
    when b == 0
      a
    else
      replace_cost = @strA[a - 1] == @strB[b - 1] ? 0 : 1

      cost_delete = distance(a - 1, b) + 1
      cost_ins = distance(a, b - 1) + 1
      cost_replace = distance(a - 1, b - 1) + replace_cost
      minCost = [cost_delete, cost_ins, cost_replace].min
      @dist[a][b] = minCost
      minCost
    end
  end
end

sDist = StringDistanceTopDown.new("TodayIsSaturday", "TomorrowIsSunday")
#sDist = StringDistanceTopDown.new("Saturday", "Sundays")
puts(sDist.distance)

