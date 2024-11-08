require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def play_round
    puts "\n\n\n\n\n\nNEW ROUND. Code is: #{@board.code}\n"
    @board.display_guesses

    puts 'What is your next guess'
    guess = gets.chomp
    return nil if guess == 'quit'

    @board.update_guess(guess)
    @board.update_hint
    @board.turn += 1
    play_round
  end
end

game = Game.new
game.play_round