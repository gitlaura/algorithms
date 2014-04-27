require "benchmark"

def run_benchmark(alg, doc)
  n = 10000

  random_values = Array.new(n) { rand(n) }
  sequential_values = (1...n).to_a
  reverse_sequential_values = (1...n).to_a.reverse

  puts
  puts doc 
  puts
  puts "Sorting #{n} random items:"
  puts Benchmark.realtime { send(alg, random_values) }
  puts
  puts "Sorting #{n} sequential items:"
  puts Benchmark.realtime { send(alg, sequential_values) }
  puts
  puts "Sorting #{n} reverse sequential items:"
  puts Benchmark.realtime { send(alg, reverse_sequential_values) }
end
