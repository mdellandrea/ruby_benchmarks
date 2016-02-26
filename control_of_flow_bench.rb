# Benchmark of several ways to lookup and return values when there is a small set of inputs/outputs.

require 'benchmark/ips'

n = ['a', 'b', 'c', 'd']
n_2 = [:a, :b, :c, :d]

Benchmark.ips do |x|
  x.report 'Case' do
    500.times do
      t = n.sample
      case t
      when 'a'
	0
      when 'b'
	1
      when 'c'
	2
      when 'd'
	3
      end
    end
  end

  x.report 'If / Else If' do
    500.times do
      t = n.sample
      if t == 'a'
        0
      elsif t == 'b'
        1
      elsif t == 'c'
        2
      elsif t == 'd'
        3
      end
    end
  end

  x.report 'Case w/ Symbols' do
    500.times do
      t = n_2.sample
      case t
      when :a
	0
      when :b
	1
      when :c
	2
      when :d
	3
      end
    end
  end

  x.compare!
end
