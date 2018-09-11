require 'gruff'

g = Gruff::Scatter.new
g.maximum_value = 100
g.minimum_value = 0

data = {}
x = []
y = []

ARGF.each_line do |line|
  next unless line =~ /^\d/
  proc, msec, percent = line.split.map(&:to_i)
  data[proc] ||= [[], []]
  data[proc][0].push msec
  data[proc][1].push percent
end

data.keys.sort.each do |proc|
  x, y = data[proc]
  g.data(proc, x, y)
end
g.write('4-2.png')
