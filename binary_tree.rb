class BinaryTree

  def self.on(grid, bias = :ne)
    neighbourhood = bias != :ne ? [:south, :west] : [:north, :east]

    grid.each_cell do |cell|
      neighbours = []
      neighbourhood.each do |neighbour_to_add|
        neighbours << cell.send(neighbour_to_add) if cell.send(neighbour_to_add)
      end

      neighbour = neighbours.sample
      cell.link(neighbour) if neighbour
    end

    grid
  end

end
