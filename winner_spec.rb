require_relative "winner"

RSpec.describe Winner do
  describe "winning combinationss" do
    it "should return true for top row" do
      winner = Winner.is_win ["X", "X", "X"]

      expect(winner).to be_truthy
    end
  end
  
  describe "not winning combinationss" do
    it "should return false for top row" do
      winner = Winner.is_win ["X", "", "X"]

      expect(winner).to be_falsey
    end
  end
end
