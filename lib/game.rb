require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def get_guess
    loop do
      puts 'Please input your guess'
      guess = gets.chomp
      return guess if guess.match?(/\A[1-6]{4}\z/) || guess == 'quit'
      puts "Invalid input. Please enter a 4-digit code using numbers 1 to 6."
    end
  end

  def start
    guess = get_guess
    return nil if guess == 'quit'

    @board.update_guess(guess)
    @board.update_hint
    @board.turn += 1

    play_round
  end

  def play_round
    return lose_game if @board.turn == 12
    return win_game if @board.game_won?

    puts "\n\n\n\n\n\nNEW ROUND. Code is: #{@board.code}. Turn is #{@board.turn}\n"
    @board.display_guesses

    guess = get_guess
    return nil if guess == 'quit'

    @board.update_guess(guess)
    @board.update_hint
      
    @board.turn += 1
    play_round
  end

  def lose_game
    puts 'You lose'
  end

  def win_game
    puts 'You win!'
  end
end

game = Game.new
game.start