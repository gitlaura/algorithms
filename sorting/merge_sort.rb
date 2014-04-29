#!/usr/bin/env ruby

doc = <<-DOC
Merge Sort
==========
Merge sort works by dividing the array into two halves, sorting the two halves (via recursion), 
then merging the result.  If an array has a 1 or 0 elements, it is already sorted.  It 
guarantees to sort N items in time proportional to NlogN.  The classic implementation, 
however, requires transferring values into an auxillary array during merge using extra 
space proportional to N.
DOC

def merge_sort(a)
  n = a.length

  if n <= 1
    a
  else
    mid = n / 2 - 1

    l = merge_sort(a[0..mid])
    r = merge_sort(a[(mid + 1)..(n - 1)])

    aux = []

    until l.empty? && r.empty?
      case
      when l.empty?
        return aux.concat(r)
      when r.empty?
        return aux.concat(l)
      when l.first < r.first
        aux << l.delete_at(0)
      else
        aux << r.delete_at(0)
      end
    end
    aux
  end
end

if ARGV.include?("-b")
  require_relative "support/benchmark"
  run_benchmark(:merge_sort, doc)
else
  require_relative "support/tests"
  run_tests(:merge_sort, doc)
end
