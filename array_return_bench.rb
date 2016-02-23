# Benchmark of various ways to return last element of an array without mutation of original array.

require 'benchmark/ips'

a = Array.new(50_000) { |i| i+1 }

Benchmark.ips do |x|
  x.report 'Using Index' do
    50_000.times do
      a[-1]
    end
  end

  x.report 'Using Last' do
    50_000.times do
      a.last
    end
  end
	
  x.report 'Using Slice' do
    50_000.times do
      a.slice -1
    end
  end

  x.report 'Using Fetch' do
    50_000.times do
      a.fetch -1
    end
  end

  x.report 'Using At' do
    50_000.times do
      a.at -1
    end
  end

  x.compare!
end
