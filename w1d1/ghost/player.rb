class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess(fragment)
    puts "#{@name}: the current fragment is '#{fragment}'"
    puts "What letter would you like to add?"
    gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid letter! Try again."
  end
end
