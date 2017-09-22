require "optparse"
require_relative "grid"
require_relative "binary_tree"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: binary_tree_demo.rb [options]"

  opts.on('-r', '--rows ROWS', 'Rows in the maze') { |v| options[:rows] = v }
  opts.on('-c', '--columns COLUMNS', 'Columns in the maze') { |v| options[:columns] = v }
  opts.on('-a', '--algorithm ALGORITHM', 'Algorithm used to create the maze') { |v| options[:algorithm] = v }
end.parse!

rows = options[:rows].to_i
columns = options[:columns].to_i

puts "initializing grid"
grid = Grid.new(rows, columns)
puts "grid created! applying binary tree"
BinaryTree.on(grid)
puts "binary tree complete!"
puts grid.to_s
