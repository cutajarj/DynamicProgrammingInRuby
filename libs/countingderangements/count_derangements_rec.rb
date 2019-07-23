class CountDerangementsRec
def initialize(set_size)
  @set_size = set_size
end

def count_derangements(i = @set_size)
  if i == 1
    0
  elsif i == 2
    1
  else
    (i - 1) * (count_derangements(i - 1) + count_derangements(i - 2))
  end
end
end

for i in 1..64
#for i in 1..10
  n = CountDerangementsRec.new(i).count_derangements
  puts("Derangments in set size %d -> %d" % [i, n])
end


