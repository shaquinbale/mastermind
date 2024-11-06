# Responsible for storing the state of the board, as well as all
# logic associated with making modifications to the board

class Board
  def initialize (code)
    @guesses = Array.new(12) { Array.new(4, nil) }
    @hints = Array.new(12) { Array.new(4, nil) }
  end
end