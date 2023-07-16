require './tic_tac_toe'
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
