# Object allocation of using inject to sum an array of integers vs using a while loop

GC.disable
 a = GC.stat[:heap_live_slots]

		[1,2,3,4,5].inject(0) { |sum, n| sum + n }

 b = GC.stat[:heap_live_slots]
 puts "Using the inject method created #{(b-a) -1} object(s)"
GC.enable

#=======================================================================================

GC.disable
 a = GC.stat[:heap_live_slots]

		x = [1,2,3,4,5]
    i,g = 0,0
    while i < 5
      g += x[i]
      i += 1
    end

 b = GC.stat[:heap_live_slots]
 puts "Using a while loop created #{(b-a) -1} object(s)"
GC.enable
