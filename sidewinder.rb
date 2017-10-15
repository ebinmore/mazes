class Sidewinder

  def self.on(grid)

    grid.each_row do |row|
      run = []

      row.each do |cell|
        run << cell

        at_eastern_boundary = (cell.east == nil)
        at_northern_boundary = (cell.north == nil)

        should_close_out =
          at_northern_boundary || (!at_eastern_boundary && rand(2) == 0)
          # at_eastern_boundary || (!at_northern_boundary && rand(2) == 0)

        if should_close_out
          member = run.sample
          # member.link(member.north) if member.north
          member.link(member.east) if member.east
          run.clear
        else
          # cell.link(cell.east)
          cell.link(cell.north)
        end
      end
    end

    grid
  end

end
