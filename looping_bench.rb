# Benchmark of various ways of looping through an array

require 'benchmark/ips'

a = Array.new(100_000){ |i| i+1 }

Benchmark.ips do |x|
  x.report 'Collect' do
    300.times do
      a.collect { |i| i }
    end
  end

  x.report 'Each' do
    300.times do
      a.each { |i| i }
    end
  end

  x.report 'Loop' do
    300.times do
      b = 0
      loop do
        a[b]
        b += 1
        break if b >= a.length
      end
    end
  end

  x.report 'While' do
    300.times do
      b = 0
      while b < a.length do
        a[b]
        b += 1
      end
    end
  end

  x.report 'For' do
    300.times do
      for i in a do
        i
      end
    end
  end

  x.report 'Until' do
    300.times do
      b = 0
      until b >= a.length do
        a[b]
        b += 1
      end
    end
  end

  x.report 'Map' do
    300.times do
      a.map { |i| i }
    end
  end

  x.compare!
end
