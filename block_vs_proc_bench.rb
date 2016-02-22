# Benchmarking block vs proc calls from within a method

require 'benchmark/ips'

def block_call &block
	block.call
end

def just_yield
	yield
end

Benchmark.ips do |x|
	x.report "Call Block" do
		500.times do
			block_call { 1 + 1 }
		end
	end

	x.report "Yield to Block" do
		500.times do
			just_yield { 1 + 1 }
		end
	end

	x.compare!
end
