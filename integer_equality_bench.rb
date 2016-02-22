# Looking at various equality operators for integer equality

require 'benchmark/ips'

a = 50

Benchmark.ips do |x|
  x.report '===' do
    100_000.times do |g|
      (rand 100) === a
    end
  end

  x.report '==' do
    100_000.times do |g|
      (rand 100) == a
    end
  end

  x.report '<=>' do
    100_000.times do |g|
      rand 100 <=> a
    end
  end

  x.report 'eql?' do
    100_000.times do |g|
      (rand 100).eql? a
    end
  end

  x.compare!
end
