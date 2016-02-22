# Benchmark of division operations for different numeric types

require 'benchmark/ips'

Benchmark.ips do |x|
  x.report 'Integer Divide' do
    100_000.times do
      4_100_000 / 3
    end
  end

  x.report 'Float Divide' do
    100_000.times do
      4_100_000.0 / 3.0
    end
  end

  x.report 'Bignum Divide' do
    100_000.times do
      41_000_000_000_000_000_000 / 3
    end
  end

  x.report 'Complex Divide' do
    100_000.times do
      (4_100_000+0i) / (3+0i)
    end
  end

  x.compare!
end
