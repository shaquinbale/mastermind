# Responsible for storing the state of the board, as well as all
# logic associated with making modifications to the board

class Board
  attr_accessor :turn

  def initialize
    @guesses = Array.new(12) { Array.new(4, nil) }
    @hints = Array.new(12) { Array.new(4, 0) }
    @turn = 0
    @code = nil
  end

  def display_board
    (0..self.turn).each do |turn|
      puts "#{self.board[turn]} - #{}"
    end
  end

  def update_hint
    @guesses[turn].each_with_index do |guess, index|
      if @code[index] == (guess)
        @guesses[index] = 1
      elsif @code.include?(guess)
        @guesses[index] =  2
      end
    end
  end
end