class Tile

  def initialize(value, given)
    @given = given
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
