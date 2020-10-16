require_relative "game"

RSpec.describe Game do
  describe "support player inputting an option" do
    before (:all) do
      cnt = 0
      @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      @game = Game.new @grid
    end
    it "gird is setup with default values" do
      expect(@game.grid[0]).to eq 1
      expect(@game.grid[1]).to eq 2
      expect(@game.grid[2]).to eq 3
      expect(@game.grid[3]).to eq 4
      expect(@game.grid[4]).to eq 5
      expect(@game.grid[5]).to eq 6
      expect(@game.grid[6]).to eq 7
      expect(@game.grid[7]).to eq 8
      expect(@game.grid[8]).to eq 9
    end

    it "allow player to select square by number" do
      player_choice = 1

      @game.add_player_choice player_choice

      expect(@game.grid[player_choice]).to eq "X"
    end

    it "allow computer to select square by number" do
      computer_choice = 1

      @game.add_computer_choice computer_choice

      expect(@game.grid[computer_choice]).to eq "O"
    end
  end
end
