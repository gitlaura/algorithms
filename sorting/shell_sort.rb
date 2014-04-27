#!/usr/bin/env ruby

doc = <<-DOC
Shell Sort
==========
Shell sort is a variation on insertion sort.  It allows for distant values to be
swapped in one operation, as opposed to insertion sort, which moves entries to the correct
position one at a time and has a potential worst case exchange rate of n - 1.  After
each iteration, selecting every hth element yields a sorted subsection and the array is said
to be "h-sorted."  The "increment sequence", or h, is decremented, eventually reaching 1, which
is then identical to an insertion sort.  The increment sequence affects the performance of
the algorithm and is guaranteed to produce a sorted array as long as the last value is 1.
DOC

def shell_sort(a)
  n = a.length

  h = 1
  while h < n / 3
    h = h * 3 + 1
  end

  while h > 0
    i = h
    while i < n
      j = i
      while j >= h && a[j] < a[j - h]
        a[j], a[j - h] = a[j - h], a[j]
        j -= h
      end
      i += 1
    end
    h /= 3
  end
  a
end

if ARGV.include?("-b")
  require_relative "benchmark"
  run_benchmark(:shell_sort, doc)
else
  require_relative "tests"
  run_tests(:shell_sort, doc)
end
