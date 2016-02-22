# Benchmark of various methods of appending to array.

require 'benchmark/ips'

Benchmark.ips do |x|
  x.report 'Using Push' do
    100.times do |g|
      a = []
      a.push g
    end
  end

  x.report 'Using <<' do
    100.times do |g|
      a = []
      a << g
    end
  end

  x.report 'Using Insert' do
    100.times do |g|
      a = []
      a.insert -1, g
    end
  end

  x.report 'Using Index' do
    100.times do |g|
      a = []
      a[a.length] = g
    end
  end

  x.compare!
end
