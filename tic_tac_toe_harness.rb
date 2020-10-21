require_relative "game"

player_wins = 0
computer_wins = 0
draws = 0
player_win_moves = []

GAMES = 1000000

puts "Started: #{Time.now.strftime("%d/%m/%Y %H:%M")}"

GAMES.times do |n|

  @game = Game.new [1, 2, 3, 4, 5, 6, 7, 8, 9]

  while @game.is_playing do
    player_choice = rand(1..9)

    @game.add_player_choice player_choice
  end

  if @game.display_result.include?("Player won!")
    player_wins += 1
    player_win_moves.push "Game #{n + 1} - #{@game.display_result}: #{@game.display_moves}"
  elsif @game.display_result.include?("Computer won!")
    computer_wins += 1
  else
    draws += 1
  end
end

puts
puts "Result - Totals"
puts "         Player won!   #{player_wins}"
puts "         Computer won! #{computer_wins}"
puts "         Drawn!        #{draws}"
puts

player_win_moves.each do |r|
  puts r
end

puts
puts "Finished: #{Time.now.strftime("%d/%m/%Y %H:%M")}"
puts
