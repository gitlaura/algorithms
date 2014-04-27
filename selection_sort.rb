benchmark = ARGV.include?("--benchmark")
test = !benchmark

def selection_sort(a)
  i = 0
  while i < a.length
    j = i + 1
    min = a[0]

    while j < a.length
      if a[j] < a[i]
        a[j], a[i] = a[i], a[j]
      end
      j += 1
    end
    i += 1
  end
  a
end

if benchmark
  require "benchmark"
  
  n = 10000
  random_values = Array.new(n) { rand(n) }

  puts "Sorting 10,000 random items:"
  puts "Array#sort:"
  puts Benchmark.realtime { random_values.sort }
  puts "#selection_sort:"
  puts Benchmark.realtime { selection_sort(random_values) }
end

if test
  require "minitest/autorun"

  describe "#selection_sort" do
    it "sorts no elements" do
      selection_sort([]).must_equal([].sort)
    end

    it "sorts a single element" do
      selection_sort([1]).must_equal([1].sort)
    end

    it "sorts many elements" do
      selection_sort("aaronlahey".split('')).must_equal("aaronlahey".split('').sort)
    end
  end
end
