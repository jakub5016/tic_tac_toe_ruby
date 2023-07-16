require './minimax'

PLAYER = 1
AI = -1

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
    if board[y][x] == nil
      board[y][x] = player
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

game = Board.new(3)

find_blanks(game)
