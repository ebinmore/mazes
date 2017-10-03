
class Cell
  attr_reader :row, :column
  attr_accessor :north, :east, :south, :west

  def initialize(row, column)
    @row, @column = row, column
    @links = {}
  end

  def link(cell, bidi = true)
    @links[cell] = true
    cell.link(self, false) if bidi
  end

  def unlink(cell, bidi = true)
    @links[cell].delete
    cell.unlink(self, false) if bidi
  end

  def links
    @links.keys
  end

  def linked?(cell)
    @links.keys.include?(cell)
  end

  def neighbours
    list = []
    list << north if north
    list << east if east
    list << south if south
    list << west if west
    list
  end

  def to_s
    "cell [#{row}, #{column}] north? #{north != nil} east? #{east != nil} south? #{south != nil} west? #{west != nil}"
  end
end
