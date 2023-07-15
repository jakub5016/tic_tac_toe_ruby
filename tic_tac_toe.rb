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

end


plansza = Board.new(3)
plansza.board[0][0] = -1
plansza.print_board
