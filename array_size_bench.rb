# Verification that Arrays > 3 elements have non-linear time increase 
# due to additional memory allocation overhead

require 'benchmark/ips'

def create_ary size
  Array.new(size){ |i| i+1 }
end

Benchmark.ips do |x|
  x.report '1 Element' do
    create_ary 1
  end

  x.report '2 Elements' do
    create_ary 2
  end
  
  x.report '3 Elements' do
    create_ary 3
  end

  x.report '4 Elements' do
    create_ary 4
  end

  x.report '5 Elements' do
    create_ary 5
  end

  x.report '6 Elements' do
    create_ary 6
  end

	x.compare!
end