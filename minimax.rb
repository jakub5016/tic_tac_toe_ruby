def find_blanks(game)
  blank_indexes = Array.new() {Array.new()}

  game.board.each_with_index do |arr, arr_index|
    arr.each_with_index do |element, index|
      if element == nil
        blank_indexes.append([index, arr_index])
      end
    end
  end

  return blank_indexes
end

def minimax(game_instance)
  puts nil
end

def wrapper(game)
  blank_indexes = find_blanks(game)
  blank_indexes.each do |arr|
    game_instance = game
    game_instance.move(AI, arr[0], arr[1])
    minimax(game_instance)
  end
 end
