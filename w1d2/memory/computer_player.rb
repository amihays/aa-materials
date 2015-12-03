class ComputerPlayer
  attr_accessor :previous_guess

  def initialize(size)
    @board_size = size
    @known_cards = {}
    @matched_cards = {}
    @previous_guess = nil
  end

  def prompt(board)
    board.render
    puts "Computer, which card would you like to flip?"
  end

  def get_input
    if @previous_guess
      make_second_guess
    else
      make_first_guess
    end
  end

  def make_second_guess
    (position, _) = @known_cards.find {|pos, value| value == @known_cards[@previous_guess] && pos != @previous_guess }
    return position if position
    random_guess
  end

  def make_first_guess
    unmatched_pair_card || random_guess
  end

  def unmatched_pair_card
    (pos, _) = @known_cards.find do |pos, val|
      @known_cards.any? do |pos2, val2|
        (val == val2 && pos != pos2) &&
        !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end
    pos
  end

  def random_guess
    position = nil
    until position && !@known_cards[position]
      position = [rand(@board_size), rand(@board_size)]
    end
    position
  end

  def receive_revealed_card(position, value)
    @known_cards[position] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true
    @matched_cards[pos2] = true
  end
end
