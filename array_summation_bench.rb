# Benchmarking some ways of summing the elements of an array

require 'benchmark/ips'

a = [1, 2, 3, 4, 5]

Benchmark.ips do |x|
  x.report 'Inject' do
    10_000.times do
      a.inject(0) { |sum, n| sum + n }
    end
  end

  x.report 'While' do
    10_000.times do
      i,g = 0,0
      while i < 5
        g += a[i]
        i += 1
      end
    end
  end

  x.report 'Reduce' do
    10_000.times do
      a.reduce :+
    end
  end

  x.compare!
end
