require_relative "game"

results = []
GAMES = 500000

puts "Started: #{Time.now.strftime("%d/%m/%Y %H:%M")}"

GAMES.times do |n|

  @game = Game.new [1, 2, 3, 4, 5, 6, 7, 8, 9]

  while @game.is_playing do
    player_choice = rand(1..9)

    @game.add_player_choice player_choice
  end

  results.push "Game #{n + 1} - #{@game.display_result}: #{@game.display_moves}"
end

puts "Finished: #{Time.now.strftime("%d/%m/%Y %H:%M")}"
puts
puts "Result - totals"
puts "         Player won!   #{results.filter {|r| r.include?("Player won!") }.count}"
puts "         Computer won! #{results.filter {|r| r.include?("Computer won!") }.count}"
puts "         Drawn!        #{results.filter {|r| r.include?("Game drawn") }.count}"
puts

player_wins = results.filter { |r| r.include?("Player won!") }

player_wins.each do |r|
  puts r
end
