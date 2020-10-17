require_relative "game"

@game = Game.new [1, 2, 3, 4, 5, 6, 7, 8, 9]

while @game.is_playing do
  puts "*************************"
  puts @game.display_grid
  puts
  puts @game.available_squares
  puts
  puts "*************************"

  response = $stdin.gets.chomp

  @game.add_player_choice response.to_i
end

puts
puts "Result: #{@game.display_result}"
