class StringDistanceRec
  def initialize(strA, strB)
    @strA = strA
    @strB = strB
  end

  def distance(a = @strA.length, b = @strB.length)
    case
    when a == 0
      b
    when b == 0
      a
    else
      replace_cost = @strA[a - 1] == @strB[b - 1] ? 0 : 1

      cost_delete = distance(a - 1, b) + 1
      cost_ins = distance(a, b - 1) + 1
      cost_replace = distance(a - 1, b - 1) + replace_cost
      [cost_delete, cost_ins, cost_replace].min
    end
  end
end

#sDist = StringDistanceTopDown.new("TodayIsSaturday", "TomorrowIsSunday")
sDist = StringDistanceRec.new("Saturday", "Sundays")
puts(sDist.distance)
