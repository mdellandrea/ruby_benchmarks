# Benchmark of removing nils from an array

require 'benchmark/ips'

c = Array.new(100) do |y|
      if y%6 == 0
        nil
      else
        y
      end
    end

Benchmark.ips do |x|
  x.report 'Using Compact' do
    1_000.times do
      c.compact
    end
  end

  x.report 'Using Reject' do
    1_000.times do
      c.reject { |x| x.nil? }
    end
  end

  x.report 'Using Each' do
    1_000.times do
      b = []
      c.each do |x|
        b << c[x] unless x.nil?
      end
    end
  end

  x.compare!
end
