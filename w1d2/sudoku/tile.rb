class Tile

  def initialize(value)
    @given = value > 0 ? true : false
    @value = value
  end

  def to_s
    if @given
      @value.colorize(red)
    else
      @value
    end
  end
end
