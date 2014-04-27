#!/usr/bin/env ruby

benchmark = ARGV.include?("-b")
test = !benchmark

doc = <<-DOC
Selection sort iterates through an array replacing the first value
with the lowest value from the rest.  It has approximately n**2/2
compares and n exchanges.  Therefore the sort time is a direct result
of the length of the array, and has nothing to do with the order of its elements
DOC

def selection_sort(a)
  i = 0
  n = a.length
  while i < n
    min = i
    j = i + 1
    while j < n
      if a[j] < a[min]
        min = j
      end
      j += 1
    end
    a[i], a[min] = a[min], a[i]
    i += 1
  end
  a
end

if benchmark
  require "benchmark"
  
  n = 10000
  random_values = Array.new(n) { rand(n) }
  sequential_values = (1...n).to_a
  reverse_sequential_values = (1...n).to_a.reverse

  puts
  puts doc 
  puts
  puts "Sorting 10,000 random items:"
  puts "Array#sort:"
  puts Benchmark.realtime { random_values.sort }
  puts "#selection_sort:"
  puts Benchmark.realtime { selection_sort(random_values) }
  puts
  puts "Sorting 10,000 sequential items:"
  puts "Array#sort:"
  puts Benchmark.realtime { sequential_values.sort }
  puts "#selection_sort:"
  puts Benchmark.realtime { selection_sort(sequential_values) }
  puts
  puts "Sorting 10,000 reverse sequential items:"
  puts "Array#sort:"
  puts Benchmark.realtime { reverse_sequential_values.sort }
  puts "#selection_sort:"
  puts Benchmark.realtime { selection_sort(reverse_sequential_values) }
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
