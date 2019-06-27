class StringDistanceTopDown
  def initialize(str_a, str_b)
    @str_a = str_a
    @str_b = str_b
    @dist = Array.new(@str_a.length + 1) {Array.new(@str_b.length + 1, -1)}
  end

  def distance(a = @str_a.length, b = @str_b.length)
    case
    when @dist[a][b] != -1
      @dist[a][b]
    when a == 0
      b
    when b == 0
      a
    else
      replace_cost = @str_a[a - 1] == @str_b[b - 1] ? 0 : 1
      cost_delete = distance(a - 1, b) + 1
      cost_insert = distance(a, b - 1) + 1
      cost_replace = distance(a - 1, b - 1) + replace_cost
      min_cost = [cost_delete, cost_insert, cost_replace].min
      @dist[a][b] = min_cost
      min_cost
    end
  end
end

#sDist = StringDistanceTopDown.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceTopDown.new("Saturday", "Sundays")
puts(sDist.distance)

