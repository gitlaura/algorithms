benchmark = ARGV.include?("--benchmark")
test = !benchmark

if benchmark
  require "benchmark"
end

if test
  require "minitest/autorun"
end
