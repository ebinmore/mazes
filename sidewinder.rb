class Sidewinder

  def self.on(grid, bias = :east)
    primary_boundary =  == :north ? :north : :east
    secondary_boundary = bias == :north ? :east : :north

    grid.each_row do |row|
      run = []

      row.each do |cell|
        run << cell

        at_primary_boundary = (cell.send(primary_boundary) == nil)
        at_secondary_boundary = (cell.send(secondary_boundary) == nil)

        should_close_out =
          at_primary_boundary || (!at_secondary_boundary && rand(2) == 0)

        if should_close_out
          member = run.sample
          member.link(member.send(secondary_boundary)) if member.send(secondary_boundary)
          run.clear
        else
          cell.link(cell.send(primary_boundary))
        end
      end
    end

    grid
  end

end
