require_relative "strategy"
require_relative "game"

RSpec.describe Strategy do
  before do
    @game = Game.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  it "computer should select middle square of grid if available" do
    @game.add_player_choice 1

    square = Strategy.move @game.grid

    @game.add_computer_choice square

    expect(square).to eq 5
    expect(@game.grid[4]).to eq "O" 
  end
end
