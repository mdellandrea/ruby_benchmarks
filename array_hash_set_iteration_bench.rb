# Benchmark of simple iteration of different collection types

require 'benchmark/ips'
require 'set'

a = Array.new(1_000_000){ |i| i+1 }
s = Set.new a
h = Hash.new { |h,k| h[k] = "A: #{k}" }

a.each do |a|
  h[a]
end

Benchmark.ips do |x|
  x.report 'Array' do
    10.times do
      a.each do |g|
        g
      end
    end
  end

  x.report 'Set' do
    10.times do
      s.each do |g|
        g
      end
    end
  end

  x.report 'Hash' do
    10.times do
      h.each do |g,v|
        v
      end
    end
  end

  x.compare!
end
