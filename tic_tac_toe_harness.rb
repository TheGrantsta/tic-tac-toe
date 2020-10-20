require_relative "game"

results = []
GAMES = 100

GAMES.times do |n|

  @game = Game.new [1, 2, 3, 4, 5, 6, 7, 8, 9]

  while @game.is_playing do
    player_choice = rand(1..9)

    @game.add_player_choice player_choice
  end

  results.push "Game #{n + 1} - #{@game.display_result}: #{@game.display_moves}"
end

puts "Result - totals"
puts "         Player won!   #{results.filter {|r| r.include?("Player won!") }.count}"
puts "         Computer won! #{results.filter {|r| r.include?("Computer won!") }.count}"
puts "         Drawn!        #{results.filter {|r| r.include?("Game drawn") }.count}"

results.each do |r|
  if r.include?("Player won!")
    puts r
  end
end

#Game 25 - Player won!: Moves: P 3; C 5; P 7; C 1; P 9; C 8; P 6
#Game 61 - Player won!: Moves: P 6; C 5; P 8; C 1; P 9; C 7; P 3
#Game 100 - Player won!: Moves: P 1; C 5; P 8; C 2; P 7; C 9; P 4
#Game 7 - Player won!: Moves: P 8; C 5; P 1; C 4; P 6; C 2; P 9; C 7; P 3
#Game 13 - Player won!: Moves: P 3; C 5; P 8; C 2; P 4; C 1; P 9; C 7; P 6
#Game 33 - Player won!: Moves: P 8; C 5; P 4; C 2; P 3; C 1; P 9; C 7; P 6
#Game 53 - Player won!: Moves: P 6; C 5; P 1; C 2; P 8; C 3; P 7; C 9; P 4
