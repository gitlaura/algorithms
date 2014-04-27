#!/usr/bin/env ruby

benchmark = ARGV.include?("-b")
test = !benchmark

doc = <<-DOC
Insertion sort iterates through an array shifting smaller values
to the left as encountered.  It has approximately n**2/4 compares and
approximately n**2/4 exchanges.  The worst case is n**2/2 compares and
exchanges, the best case is n - 1 compares and 0 exchanges.  It is useful
for partially sorted arrays found in practice.
DOC

def insertion_sort(a)
  i = 1
  n = a.length
  while i < n
    j = i
    while j > 0 && a[j] < a[j - 1]
      a[j], a[j - 1] = a[j - 1], a[j]
      j -= 1
    end
    i += 1
  end
  a
end

if benchmark
  require "benchmark"
  
  n = 10000
  random_values = Array.new(n) { rand(n) }
  sequential_values = (1...10000).to_a
  reverse_sequential_values = (1...n).to_a.reverse

  puts
  puts doc 
  puts
  puts "Sorting 10,000 random items:"
  puts "Array#sort:"
  puts Benchmark.realtime { random_values.sort }
  puts "#insertion_sort:"
  puts Benchmark.realtime { insertion_sort(random_values) }
  puts
  puts "Sorting 10,000 sequential items:"
  puts "Array#sort:"
  puts Benchmark.realtime { sequential_values.sort }
  puts "#insertion_sort:"
  puts Benchmark.realtime { insertion_sort(sequential_values) }
  puts
  puts "Sorting 10,000 reverse sequential items:"
  puts "Array#sort:"
  puts Benchmark.realtime { reverse_sequential_values.sort }
  puts "#selection_sort:"
  puts Benchmark.realtime { insertion_sort(reverse_sequential_values) }
end

if test
  require "minitest/autorun"

  describe "#insertion_sort" do
    it "sorts no elements" do
      insertion_sort([]).must_equal([].sort)
    end

    it "sorts a single element" do
      insertion_sort([1]).must_equal([1].sort)
    end

    it "sorts many elements" do
      insertion_sort("aaronlahey".split('')).must_equal("aaronlahey".split('').sort)
    end
  end
end
