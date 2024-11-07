require_relative 'board'
require_relative 'CLI'
require_relative 'setter'
require_relative 'guesser'

class Game
  def initialize
    @cli = CLI.new
    @setter = Setter.new
    @guesser = Guesser.new
    @board = Board.new

    puts 'MASTERMIND'
    puts "\n1) Start"
    start(gets.chomp)
  end
  def start(choice)
    if choice == '1'
      play_game
    else
      puts "Invalid choice. Try again."
      start
    end
  end

  def play_game
    puts "\nInput your first guess"
    guess = gets.chomp
    unless valid_guess?(guess)
      puts "Invalid guess. must be 4 characters long, with each digit being between 1 and 6"
      play_game
    end
    guess = guess.to_i
    @board.code = @setter.generate_code
  end

  def valid_guess?(guess)
    guess.match?(/\A[1-6]{4}\z/)
  end
end

game = Game.new