class StringDistanceRec
  def initialize(strA, strB)
    @str_A = strA
    @str_B = strB
  end

  def distance(a = @str_A.length, b = @str_B.length)
    case
    when a == 0
      b
    when b == 0
      a
    else
      replace_cost = @str_A[a - 1] == @str_B[b - 1] ? 0 : 1

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
