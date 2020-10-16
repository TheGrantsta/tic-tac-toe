require_relative "winner"

RSpec.describe Winner do
  describe "winning combinationss" do
    before do
      @grid = Array.new(9, "")
    end
    it "should return true for top row" do
      @grid[0] = "X"; @grid[1] = "X"; @grid[2] = "X"

      winner = Winner.new @grid

      expect(winner.is_win).to be_truthy
    end

    it "should return true for middle row" do
      @grid[3] = "X"; @grid[4] = "X"; @grid[5] = "X"

      winner = Winner.new @grid

      expect(winner.is_win).to be_truthy
    end

    it "should return true for bottom row" do
      @grid[6] = "X"; @grid[7] = "X"; @grid[8] = "X"

      winner = Winner.new @grid

      expect(winner.is_win).to be_truthy
    end
  end

  describe "not winning combinationss" do
    before do
      @grid = ["", "", "", "", "", "", "", "", "", ""]
    end
    it "should return false for top row" do
      @grid[0] = "X"; @grid[1] = "X"; @grid[2] = "O"

      winner = Winner.new @grid

      expect(winner.is_win).to be_falsey
    end

    it "should return false for middle row" do
      @grid[3] = "X"; @grid[4] = "O"; @grid[5] = "X"

      winner = Winner.new @grid

      expect(winner.is_win).to be_falsey
    end

    it "should return false for bottom row" do
      @grid[6] = "O"; @grid[7] = "O"; @grid[8] = "X"

      winner = Winner.new @grid

      expect(winner.is_win).to be_falsey
    end
  end
end
