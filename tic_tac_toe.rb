class Board
  attr_accessor :size, :board

  def initialize(size)
    @size = size
    @board = Array.new(size) {Array.new(size)}
  end

  def print_board()
    for i in @board
      print ("|")
      for j in i
        if j == nil
          print (" |")
        elsif j == -1
          print ("X|")
        elsif j == 1
          print ("O|")
        end
      end
      print ("\n")
    end

  end

  def check_win()
    #Check for horizontal win
    for i in @board
      if ((i.uniq.count <= 1) && (i[0] != nil))
        return i[0]
      end
    end

    #Check for vertical win
    for i in @board.transpose()
      if ((i.uniq.count <= 1) && (i[0] != nil))
        return i[0]
      end
    end

    #Check for diagonal win 1
    i = 0
    counter = 0
    while i<@size
      if ((@board[i][i] == @board[0][0]) && (@board[i][i] != nil))
        counter = counter+1
      end
      i = i+1
    end

    if counter == @size
      return @board[0][0]
    end

    #Check for diagonal win 2
    i = 0
    counter = 0
    while i<@size
      if ((@board[i][@size -1 - i] == @board[0][@size -1]) && (@board[i][@size -1 - i] != nil))
        counter = counter+1
      end
      i = i+1
    end

    if counter == @size
      return @board[0][@size-1]
    end
    #No win? Return 0
    return 0
  end

  def move(player, x, y)
    if board[x][y] == nil
      board[x][y] = player
      return 0
    else
      return -1 # Returns an error
    end
  end

  def is_any_left()
    for i in @board
      for j in i
        if j == nil
          return true
        end
      end
    end
    return false
  end
end


PLAYER = 1
AI = -1
SIZE = 3
game = Board.new(SIZE)

while ((game.check_win == 0) && (game.is_any_left()))
  game.print_board()
  puts "Insert x value of your move"
  player_move_x = gets.to_i
  puts "Insert y value of your move"
  player_move_y = gets.to_i

  while game.move(PLAYER, player_move_x, player_move_y) != 0
    puts "Invalid input, try again"
    puts "Insert x value of your move"
    player_move_x = gets.to_i
    puts "Insert y value of your move"
    player_move_y = gets.to_i
  end

  random_x = rand(SIZE)
  random_y = rand(SIZE)
  while game.move(AI, random_x, random_y) != 0 # Try to randomize again
    random_x = rand(SIZE)
    random_y = rand(SIZE)
  end
end

game.print_board()
if game.check_win == -1
  puts "X WINS"

elsif game.check_win == 1
  puts "O WINS"

else
  puts "TIE"
end
