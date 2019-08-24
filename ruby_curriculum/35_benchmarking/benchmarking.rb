require 'benchmark'
require_relative 'execution_time'

puts 'Please enter an array size' 
n = gets.chomp.to_i
arr = (1..n).map { rand(100) } 

Benchmark.bmbm do |benchmark| 
  benchmark.report("O(n^3):" "#{arr.size} elements") { largest_contiguous_subsum(arr) }
  benchmark.report("O(n):" "#{arr.size} elements") { better_largest_contiguous_subsum(arr) } 
end