class StringDistanceRec
  def initialize(str_a, str_b)
    @str_a = str_a
    @str_b = str_b
  end

  def distance(a = @str_a.length, b = @str_b.length)
    case
    when a == 0
      b
    when b == 0
      a
    else
      replace_cost = @str_a[a - 1] == @str_b[b - 1] ? 0 : 1

      cost_delete = distance(a - 1, b) + 1
      cost_insert = distance(a, b - 1) + 1
      cost_replace = distance(a - 1, b - 1) + replace_cost
      [cost_delete, cost_insert, cost_replace].min
    end
  end
end

#sDist = StringDistanceRec.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceRec.new("Saturday", "Sundays")
puts(sDist.distance)
