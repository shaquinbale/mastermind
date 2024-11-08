require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def get_guess
    loop do
      puts 'What is your next guess'
      guess = gets.chomp
      return guess if guess.match?(/\A[1-6]{4}\z/) || guess == 'quit'
      puts "Invalid input. Please enter a 4-digit code using numbers 1 to 6."
    end
  end

  def play_round
    puts "\n\n\n\n\n\nNEW ROUND. Code is: #{@board.code}\n"
    @board.display_guesses

    guess = get_guess
    return nil if guess == 'quit'

    @board.update_guess(guess)
    @board.update_hint

    if @board.turn > 12
      lose_game
    elsif @board.game_won?
      win_game
    else
      @board.turn += 1
      play_round
    end
  end

  def lose_game
    puts 'you lose'
  end

  def win_game
    puts 'you win'
  end
end

game = Game.new
game.play_round