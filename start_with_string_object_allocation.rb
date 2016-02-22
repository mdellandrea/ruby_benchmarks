# Looking at string allocation for the start_with? method when iterating a 10 item array

z = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']

def match_str_expr col
  if col.start_with? 'j'
    true
  end
end

def match_str_expr_frozen col
  if col.start_with? 'j'.freeze
    true
  end
end

GC.disable
 a = GC.stat[:heap_live_slots]

    z.each do |x|
      match_str_expr x
    end

 b = GC.stat[:heap_live_slots]
 puts "Using the str method created #{(b-a) -1} object(s)"
GC.enable

#=======================================================================================

GC.disable
 a = GC.stat[:heap_live_slots]

    z.each do |x|
      match_str_expr_frozen x
    end

 b = GC.stat[:heap_live_slots]
 puts "Using the frozen str method created #{(b-a) -1} object(s)"
GC.enable
