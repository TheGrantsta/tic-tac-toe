require_relative "game"

@game = Game.new [1, 2, 3, 4, 5, 6, 7, 8, 9]

puts "*************************"

puts @game.display_grid
puts

while @game.is_playing do
  puts @game.available_squares
  response = $stdin.gets.chomp

  @game.add_player_choice response.to_i
  puts
  puts @game.display_grid
end

puts "*************************"
