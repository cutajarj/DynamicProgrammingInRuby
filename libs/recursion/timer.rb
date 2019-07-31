def countdown(n)
  return if n < 0
  puts(n)
  sleep(1)
  countdown(n - 1)
end

countdown(5)
