#Tic Tac Toe Object Oriented

class Board

  WINS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  
  def initialize
    @b = {}
    (1..9).each do |key|
      @b[key] = ' '
    end
  end

  def draw
  system("clear")
   puts "\n\n
   #{@b[1]} | #{@b[2]} | #{@b[3]}\n
  ----------\n
   #{@b[4]} | #{@b[5]} | #{@b[6]}\n
  ----------\n
   #{@b[7]} | #{@b[8]} | #{@b[9]}\n"
  end 

  def mark (key, marker)
    @b[key]=marker
  end

  def empty_square
    @b.select {|k,v| v == " "}.keys
  end

  def winner  
    WINS.each do |line|
      return "Player" if @b.values_at(*line).count('X') == 3
      return "Computer" if @b.values_at(*line).count('O') == 3
    end
    nil
  end

end

class Game
  
  def initialize
    system 'clear'
    @board = Board.new
  end
  
  def p_choice
    puts "Choose a square using the numbers 1-9."
    n=gets.chomp.to_i
    @board.mark(n, "X")
  end
  
  def c_choice
    n= @board.empty_square.sample 
    @board.mark(n, "O")
  end
  
  def full
    if @board.empty_square.count == 0
    puts "Game over.  It's a tie!  Want to play again?  (Y/N)"
    a = gets.chomp.upcase
    system 'clear'
      if a == "Y" ? play : abort
      end
    end
  end
  
  def win
    x=@board.winner
    if (x == "Player") || (x == "Computer")
    puts "#{x} wins!!! Want to play again?  (Y/N)"
    a = gets.chomp.upcase
    system 'clear'
      if a == "Y" ? play : abort
      end
    end
    nil
  end
    
  def play
    initialize
    @board.draw
    loop do
      p_choice
      @board.draw
      full
      win
      c_choice
      @board.draw
      full
      win
    end
  end
end
   
Game.new.play 
  
 