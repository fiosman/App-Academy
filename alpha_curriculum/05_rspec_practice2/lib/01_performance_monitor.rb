def measure(times = 1, &prc)
  start_time = Time.now
  times.times { prc.call }
  (Time.now - start_time) / times
end
