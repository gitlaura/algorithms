#!/usr/bin/env ruby

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

if ARGV[0] == "-b"
  require_relative "benchmark"
  run_benchmark(:selection_sort, doc)
else
  require_relative "tests"
  run_tests(:selection_sort, doc)
end
