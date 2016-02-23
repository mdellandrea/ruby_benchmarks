# Verification whether calling a hash key by string repeatedly allocates a string per call

h = { 'o' => 'u', 't' => 'b', 'h' => 's' }

GC.disable
  a = GC.stat[:heap_live_slots]
    
  10.times do
    h['t']
  end

  b = GC.stat[:heap_live_slots]
GC.enable

puts "Using option 1 created #{ (b-a) -1 } object(s)"

#=======================================================================================

GC.disable
  a = GC.stat[:heap_live_slots]

  10.times do
    h['t'.freeze]
  end

  b = GC.stat[:heap_live_slots]
GC.enable

puts "Using option 2 created #{ (b-a) -1 } object(s)"
