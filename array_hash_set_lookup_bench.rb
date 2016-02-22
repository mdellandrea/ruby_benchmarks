# Benchmark to test iteration and interaction of collections
# checking for membership of a value in one collection, based on values in another collection

require 'benchmark'
require 'set'

doc_a = []
doc_h = {}
doc_s = Set.new

Document = Struct.new :id,:a,:b,:c

1.upto 50_000 do |n|
  d = Document.new n
  doc_a << d
  doc_h[d.id] = d
  doc_s << d
end

a = Array.new(10_000){ rand 10_000 +1 }
s = Set.new a

Benchmark.bm 10 do |x|
  x.report('Array / Array'){ a.each { |i| doc_a.any?{ |d| d.id == i }}}

  x.report('Array / Hash'){ a.each { |i| doc_h.has_key? i }}

  x.report('Array / Hash v2'){ a.any? { |i| doc_h.key? i }}

  x.report('Array / Set'){ a.each { |i| doc_s.include? i }}

  x.report('Set / Hash'){ s.any? { |i| doc_h.key? i }}
end
