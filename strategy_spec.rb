require_relative "strategy"

RSpec.describe Strategy do
  describe "force player to select strategy.move that stops computer winning - second turn" do
    it "player selects 1 then 8 computer should select" do
      strategy = Strategy.new ["X", 2, 3, 4, "O", 6, 7, "X", 9]

      expect(strategy.move).to eq 4
    end

    it "player selects 3 then 8 computer should select" do
      strategy = Strategy.new [1, 2, "X", 4, "O", 6, 7, "X", 9]

      expect(strategy.move).to eq 4
    end

    it "player selects 1 then 6 computer should select" do
      strategy = Strategy.new ["X", 2, 3, 4, "O", "X", 7, 8, 9]

      expect(strategy.move).to eq 2
    end

    it "player selects 3 then 4 computer should select" do
      strategy = Strategy.new [1, 2, "X", "X", "O", 6, 7, 8, 9]

      expect(strategy.move).to eq 2
    end

    it "player selects 4 then 6 computer should select" do
      strategy = Strategy.new [1, 2, 3, "X", "O", "X", 7, 8, 9]

      expect(strategy.move).to eq 2
    end

    it "player selects 5 then 9 computer should select" do
      strategy = Strategy.new ["O", 2, 3, 4, "X", 6, 7, 8, "X"]

      expect(strategy.move).to eq 3
    end
  end

  describe "select strategy.move that creates a completed strategy.move" do
    it "player selects 1 then 6 then 8 computer should select" do
      strategy = Strategy.new ["X", "O", 3, 4, "O", "X", 7, "X", 9]

      expect(strategy.move).to eq 9
    end
  end

  describe "first computer selection" do
    it "computer should select middle strategy.move of grid if available" do
      strategy = Strategy.new ["X", 2, 3, 4, 5, 6, 7, 8, 9]

      expect(strategy.move).to eq 5
    end

    it "computer should select first strategy.move of grid if middle strategy.move is taken" do
      strategy = Strategy.new [1, 2, 3, 4, "X", 6, 7, 8, 9]

      expect(strategy.move).to eq 1
    end
  end

  describe "computer should not select strategy.move to win if it is taken" do
    it "should not select winning option for the top row" do
      strategy = Strategy.new ["X", "O", "O", 4, 5, 6, 7, 8, 9]

      expect(strategy.move).to eq 5
    end

    it "should not select winning option for the first column" do
      strategy = Strategy.new ["O", 2, 3, "X", 5, 6, "O", 8, 9]

      expect(strategy.move).to eq 2
    end

    it "should not select winning option for the right to left diagonal" do
      strategy = Strategy.new [1, 2, "O", 4, "X", 6, "O", 8, 9]

      expect(strategy.move).to eq 0
    end

    it "should not select winning option for the left to right diagonal" do
      strategy = Strategy.new ["O", 2, 3, 4, "X", 6, 7, 8, "O"]

      expect(strategy.move).to eq 0
    end
  end

  describe "computer should select strategy.move to win - top row" do
    it "should select winning option for the top row" do
      strategy = Strategy.new [1, "O", "O", 4, 5, 6, 7, 8, 9]

      expect(strategy.move).to eq 1
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new ["O", 2, "O", 4, 5, 6, 7, 8, 9]

      expect(strategy.move).to eq 2
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new ["O", "O", 3, 4, 5, 6, 7, 8, 9]

      expect(strategy.move).to eq 3
    end
  end

  describe "computer should select strategy.move to win - middle row" do
    it "should select winning option for the top row" do
      strategy = Strategy.new [1, 2, 3, 4, "O", "O", 7, 8, 9]

      expect(strategy.move).to eq 4
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new [1, 2, 3, "O", 5, "O", 7, 8, 9]

      expect(strategy.move).to eq 5
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new [1, 2, 3, "O", "O", 6]

      expect(strategy.move).to eq 6
    end
  end

  describe "computer should select strategy.move to win - bottom row" do
    it "should select winning option for the top row" do
      strategy = Strategy.new [1, 2, 3, 4, 5, 6, 7, "O", "O"]

      expect(strategy.move).to eq 7
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new [1, 2, 3, 4, 5, 6, "O", 8, "O"]

      expect(strategy.move).to eq 8
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new [1, 2, 3, 4, 5, 6, "O", "O", 9]

      expect(strategy.move).to eq 9
    end
  end

  describe "computer should select strategy.move to win - first column" do
    it "should select winning option for the first column" do
      strategy = Strategy.new [1, 2, 3, "O", 5, 6, "O", 8, 9]

      expect(strategy.move).to eq 1
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new ["O", 2, 3, 4, 5, 6, "O", 8, 9]

      expect(strategy.move).to eq 4
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new ["O", 2, 3, "O", 5, 6, 7, 8, 9]

      expect(strategy.move).to eq 7
    end
  end

  describe "computer should select strategy.move to win - second column" do
    it "should select winning option for the first column" do
      strategy = Strategy.new [1, 2, 3, 4, "O", 6, 7, "O", 9]

      expect(strategy.move).to eq 2
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new [1, "O", 3, 4, 5, 6, 7, "O", 9]

      expect(strategy.move).to eq 5
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new [1, "O", 3, 4, "O", 6, 7, 8, 9]

      expect(strategy.move).to eq 8
    end
  end

  describe "computer should select strategy.move to win - third column" do
    it "should select winning option for the first column" do
      strategy = Strategy.new [1, 2, 3, 4, 5, "O", 7, 8, "O"]

      expect(strategy.move).to eq 3
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new [1, 2, "O", 4, 5, 6, 7, 8, "O"]

      expect(strategy.move).to eq 6
    end

    it "should select winning option for the top row" do
      strategy = Strategy.new [1, 2, "O", 4, 5, "O", 7, 8, 9]

      expect(strategy.move).to eq 9
    end
  end

  describe "computer should select strategy.move to win - diagonal" do
    it "should select winning option for the right to left diagonal" do
      strategy = Strategy.new [1, 2, "O", 4, 5, 6, "O", 8, 9]

      expect(strategy.move).to eq 5
    end

    it "should select winning option for the left to right diagonal" do
      strategy = Strategy.new ["O", 2, 3, 4, "O", 6, 7, 8, 9]

      expect(strategy.move).to eq 9
    end
  end

  describe "computer should select strategy.move to prevent player winning - across" do
    it "should select option top row" do
      strategy = Strategy.new ["X", 2, "X", 4, 5, 6, "O", 8, 9]

      expect(strategy.move).to eq 2
    end

    it "should select option middle row" do
      strategy = Strategy.new ["X", 2, 3, "X", "X", 6, "O", 8, 9]

      expect(strategy.move).to eq 6
    end

    it "should select option bottom row" do
      strategy = Strategy.new ["O", 2, 3, 4, "O", 6, "X", "X", 9]

      expect(strategy.move).to eq 9
    end
  end

  describe "computer should select strategy.move to prevent player winning - down" do
    it "should select option first column" do
      strategy = Strategy.new ["X", 2, 3, "X", "O", 6, 7, 8, 9]

      expect(strategy.move).to eq 7
    end

    it "should select option second column" do
      strategy = Strategy.new [1, "X", 3, "O", "X", 6, 7, 8, 9]

      expect(strategy.move).to eq 8
    end

    it "should select option third column" do
      strategy = Strategy.new [1, 2, "X", 4, "O", 6, 7, 8, "X"]

      expect(strategy.move).to eq 6
    end
  end

  describe "computer should select strategy.move to prevent player winning - diagonal" do
    it "should select option left to right" do
      strategy = Strategy.new ["X", 2, 3, 4, "X", "O", 7, 8, 9]

      expect(strategy.move).to eq 9
    end

    it "should select option right to left" do
      strategy = Strategy.new [1, 2, "X", 4, "X", 6, 7, "O", 9]

      expect(strategy.move).to eq 7
    end
  end
end
