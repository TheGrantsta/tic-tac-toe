require_relative "game"

RSpec.describe Game do
  describe "support player inputting an option" do
    before do
      @game = Game.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

    it "should setup the game with the player's turn" do
      expect(@game.turn).to eq "Player"
    end

    it "allow player to select square by number" do
      @game.add_player_choice 1

      expect(@game.grid[0]).to eq "X"
      expect(@game.turn).to eq "Player"
    end

    it "allow computer to select square by number" do
      @game.add_computer_choice 1

      expect(@game.grid[0]).to eq "O"
    end

    it "should alternate between player to computer to player" do
      @game.add_player_choice 1
      @game.add_computer_choice 2

      expect(@game.turn).to eq "Player"
    end

    it "should not allow player to select square already taken" do
      @game.add_computer_choice 1
      @game.add_player_choice 1

      expect(@game.grid[0]).to eq "O"
      expect(@game.turn).to eq "Player"
    end

    it "should return list of available squares - after setup" do
      expect(@game.available_squares).to eq "Please select available square: 1, 2, 3, 4, 5, 6, 7, 8, 9"
    end

    it "should return list of available squares - after two moves" do
      @game.add_player_choice 2

      expect(@game.available_squares).to eq "Please select available square: 3, 4, 5, 6, 7, 8, 9"
      expect(@game.is_playing).to be_truthy
    end

    it "should return empty list of available squares - after five moves" do
      @game.add_player_choice 1; @game.add_player_choice 3;
      @game.add_player_choice 5; @game.add_player_choice 7; @game.add_player_choice 9;

      expect(@game.available_squares).to eq "Please select available square: "
      expect(@game.is_playing).to be_falsey
    end

    it "should display state of the game after three moves" do
      @game.add_player_choice 2
      @game.add_player_choice 3

      expect(@game.display_grid).to eq "Grid: O, X, X, O, 5, 6, 7, 8, 9"
    end
  end
end
