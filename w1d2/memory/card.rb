class Card
  attr_reader :value

  def initialize(value)
    @faceup = false
    @value = value
  end

  def display
    @faceup ? @value : nil
  end

  def reveal
    @faceup = true
  end

  def hide
    @faceup = false
  end

  def to_s
    @faceup ? @value.to_s : "x"
  end

  def ==(other_card)
    @value == other_card.value
  end
end
