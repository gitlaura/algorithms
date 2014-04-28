#!/usr/bin/env ruby

doc = <<-DOC
Insertion Sort
==============
Insertion sort iterates through an array shifting smaller values
to the left as encountered.  It has approximately n**2/4 compares and
approximately n**2/4 exchanges.  The worst case is n**2/2 compares and
exchanges, the best case is n - 1 compares and 0 exchanges.
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

if ARGV.include?("-b")
  require_relative "support/benchmark"
  run_benchmark(:insertion_sort, doc)
else
  require_relative "support/tests"
  run_tests(:insertion_sort, doc)
end
