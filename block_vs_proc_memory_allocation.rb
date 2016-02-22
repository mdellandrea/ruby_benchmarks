# Memory allocation costs of creating a closure

GC.disable
  y = GC.stat[:malloc_increase_bytes]

		def block_call &block
			block.call
		end

		block_call { 1 + 1 }

  z = GC.stat[:malloc_increase_bytes]

  memory_change_1 = z-y
GC.enable

#==================================================================================================

GC.disable
  y = GC.stat[:malloc_increase_bytes]

		def just_yield
			yield
		end

		just_yield { 1 + 1 }

  z = GC.stat[:malloc_increase_bytes]

  memory_change_2 = z-y
GC.enable

puts "creating a closure allocated an additonal #{ memory_change_1 - memory_change_2 } bytes of RAM"
