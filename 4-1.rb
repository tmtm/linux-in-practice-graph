require 'gruff'

g = Gruff::Scatter.new
g.maximum_value = 3
g.minimum_value = 0
g.circle_radius = 3

x = []
y = []

ARGF.each_line do |line|
  next unless line =~ /^\d/
  cpu, msec, percent = line.split.map(&:to_i)
  x.push msec
  y.push cpu
end

g.data('.', x, y)
g.write('4-1.png')
