require_relative 'board'
require_relative 'CLI'

class Game
  def initialize
    @cli = CLI.new
    @board = Board.new
    
    @turn = 0
    @code = code

    @cli.main_menu
    start
  end
  def start
    choice = gets.chomp

    if choice == '1'
      
    else
      puts "Invalid choice. Try again."
      start
    end
  end
end