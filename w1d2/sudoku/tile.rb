require "colorize"

class Tile
  attr_accessor :value

  def initialize(value)
    @given = value.to_i > 0 ? true : false
    @value = value
  end

  def to_s
    if @given
      @value.colorize(:red)
    elsif @value == "0"
      "-"
    else
      @value
    end
  end
end
