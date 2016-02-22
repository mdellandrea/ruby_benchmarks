# Benchmark of checking membership of a value within different collection types

require 'benchmark/ips'
require 'set'

a = Array.new(1_000_000){ |i| i+1 }
s = Set.new a
h = Hash.new { |h,k| h[k] = "A: #{k}" }

a.each do |a|
  h[a]
end

Benchmark.ips do |x|
  x.report 'Array include?' do
    a.include? a.sample
  end

  x.report 'Array any?' do
    a.any?{ |f| f == a.sample }
  end
  x.report 'Set include?' do
    s.include? a.sample
  end

  x.report 'Hash key?' do
    h.key? a.sample
  end

  y.compare!
end
