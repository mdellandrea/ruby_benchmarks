# Verification that strings longer than 23 characters have additional memory allocation overhead

require 'benchmark/ips'

s = '12345678901234567890'

Benchmark.ips do |x|
  x.report '21 characters' do
    2_000.times do
      z = s + '1'
    end
  end

  x.report '22 characters' do
    2_000.times do
      z = s + '12'
    end
  end
	
  x.report '23 characters' do
    2_000.times do
      z = s + '123'
    end
  end

  x.report '24 characters' do
    2_000.times do
      z = s + '1234'
    end
  end

  x.report '25 characters' do
    2_000.times do
      z = s + '12345'
    end
  end

  x.report '26 characters' do
    2_000.times do
      z = s + '123456'
    end
  end

  x.compare!
end
