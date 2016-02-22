# Benchmark of iterating array using mutation

require 'benchmark/ips'

a = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']
add_x = Proc.new { |i| i + 'x' }

def recursive_add_x b, i=0
	b[i] = b[i] + 'x'
	recursive_add_x b, i + 1 if i < b.length - 1
	b
end

Benchmark.ips do |x|
	x.report 'Map! Enumerator' do
		500.times do
			a.map! &add_x
		end
	end

	x.report 'While Loop' do
		500.times do
			i = 0; while i <= a.length - 1 do
				a[i] = a[i] + 'x'
				i += 1
			end
		end
	end

	x.report 'Each Enumerator' do
		500.times do
			a.each_with_index { |v,i| a[i] = add_x.(v) }
		end
	end

	x.report 'Recursive Method' do
		500.times do
			recursive_add_x a
		end
	end

	x.compare!
end
