require "optparse"
require_relative "grid"
require_relative "binary_tree"
require_relative "sidewinder"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: binary_tree_demo.rb [options]"

  opts.on('-r', '--rows ROWS', 'Rows in the maze') { |v| options[:rows] = v }
  opts.on('-c', '--columns COLUMNS', 'Columns in the maze') { |v| options[:columns] = v }
  opts.on('-a', '--algorithm ALGORITHM', 'Algorithm used to create the maze') { |v| options[:algorithm] = v }
  opts.on('-b', '--bias BIAS', 'Bias used by the algorithm - different depending on the algorithm type') { |v| options[:bias] = v.to_sym }
end.parse!

# add some defaults
options = { rows: 20, columns: 20, algorithm: "binary_tree", bias: "east" }.merge(options)

rows = options[:rows].to_i
columns = options[:columns].to_i

puts "initializing grid"
grid = Grid.new(rows, columns)
puts "grid created!"

case options[:algorithm]
when 'binary_tree'
  print "applying binary tree algorithm to grid..."
  grid = BinaryTree.on(grid)
when 'sidewinder'
  print "applying sidewinder algorithm to grid..."
  grid = Sidewinder.on(grid, options[:bias])
end
puts "complete!"
puts grid.to_s
