# Memory allocation costs of creating a closure

def block_call &block
  block.call
end

def just_yield
  yield
end

GC.disable
  y = GC.stat[:malloc_increase_bytes]

  block_call { 1 + 1 }

  z = GC.stat[:malloc_increase_bytes]
GC.enable

memory_change_1 = z-y

#==================================================================================================

GC.disable
  y = GC.stat[:malloc_increase_bytes]

    just_yield { 1 + 1 }

  z = GC.stat[:malloc_increase_bytes]
GC.enable

memory_change_2 = z-y

puts "creating a closure allocated an additonal #{ memory_change_1 - memory_change_2 } bytes of RAM"
