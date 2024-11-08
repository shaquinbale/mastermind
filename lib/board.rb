# Responsible for storing the state of the board, as well as all
# logic associated with making modifications to the board

class Board
  attr_accessor :turn, :guesses, :code

  def initialize
    @guesses = Array.new(12) { Array.new(4, nil) }
    @hints = Array.new(12) { Array.new(4, 'X') }
    @turn = 0
    @code = Array.new(4) { rand(1..6) }
  end

  def display_guesses
    (0..self.turn).each do |turn|
      puts "#{@guesses[turn - 1]} - #{@hints[turn - 1]}"
    end
  end

  def update_hint
    @guesses[self.turn].each_with_index do |guess, index|
      if @code[index] == (guess)
        @hints[self.turn][index] = 'O'
      elsif @code.include?(guess)
        @hints[self.turn][index] =  '/'
      end
    end
  end

  def update_guess(dirty_guess)
    guess = dirty_guess.chars.map(&:to_i)
    @guesses[@turn] = guess
  end
end
