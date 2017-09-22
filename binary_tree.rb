class BinaryTree

  def self.on(grid)
    grid.each_cell do |cell|
      neighbours = []
      puts "cell[#{cell.row}, #{cell.column}]"
      neighbours << cell.north if cell.north
      neighbours << cell.east if cell.east

      neighbour = neighbours.sample
      cell.link(neighbour) if neighbour
    end

    grid
  end

end
