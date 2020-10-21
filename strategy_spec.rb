require_relative "strategy"

RSpec.describe Strategy do
  describe "force player to select square that stops computer winning - second turn" do
    it "player selects 1 then 8 computer should select" do
      square = Strategy.move ["X", 2, 3, 4, "O", 6, 7, "X", 9]

      expect(square).to eq 4
    end

    it "player selects 3 then 8 computer should select" do
      square = Strategy.move [1, 2, "X", 4, "O", 6, 7, "X", 9]

      expect(square).to eq 4
    end

    it "player selects 1 then 6 computer should select" do
      square = Strategy.move ["X", 2, 3, 4, "O", "X", 7, 8, 9]

      expect(square).to eq 2
    end

    it "player selects 3 then 4 computer should select" do
      square = Strategy.move [1, 2, "X", "X", "O", 6, 7, 8, 9]

      expect(square).to eq 2
    end

    it "player selects 4 then 6 computer should select" do
      square = Strategy.move [1, 2, 3, "X", "O", "X", 7, 8, 9]

      expect(square).to eq 2
    end
  end

  describe "select square that creates a completed square" do
    it "player selects 1 then 6 then 8 computer should select" do
      square = Strategy.move ["X", "O", 3, 4, "O", "X", 7, "X", 9]

      expect(square).to eq 9
    end
  end

  describe "first computer selection" do
    it "computer should select middle square of grid if available" do
      square = Strategy.move ["X", 2, 3, 4, 5, 6, 7, 8, 9]

      expect(square).to eq 5
    end

    it "computer should select first square of grid if middle square is taken" do
      square = Strategy.move [1, 2, 3, 4, "X", 6, 7, 8, 9]

      expect(square).to eq 1
    end
  end

  describe "computer should not select square to win if it is taken" do
    it "should not select winning option for the top row" do
      square = Strategy.move ["X", "O", "O", 4, 5, 6, 7, 8, 9]

      expect(square).to eq 5
    end

    it "should not select winning option for the first column" do
      square = Strategy.move ["O", 2, 3, "X", 5, 6, "O", 8, 9]

      expect(square).to eq 2
    end

    it "should not select winning option for the right to left diagonal" do
      square = Strategy.move [1, 2, "O", 4, "X", 6, "O", 8, 9]

      expect(square).to eq 0
    end

    it "should not select winning option for the left to right diagonal" do
      square = Strategy.move ["O", 2, 3, 4, "X", 6, 7, 8, "O"]

      expect(square).to eq 0
    end
  end

  describe "computer should select square to win - top row" do
    it "should select winning option for the top row" do
      square = Strategy.move [1, "O", "O", 4, 5, 6, 7, 8, 9]

      expect(square).to eq 1
    end

    it "should select winning option for the top row" do
      square = Strategy.move ["O", 2, "O", 4, 5, 6, 7, 8, 9]

      expect(square).to eq 2
    end

    it "should select winning option for the top row" do
      square = Strategy.move ["O", "O", 3, 4, 5, 6, 7, 8, 9]

      expect(square).to eq 3
    end
  end

  describe "computer should select square to win - middle row" do
    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, 3, 4, "O", "O", 7, 8, 9]

      expect(square).to eq 4
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, 3, "O", 5, "O", 7, 8, 9]

      expect(square).to eq 5
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, 3, "O", "O", 6]

      expect(square).to eq 6
    end
  end

  describe "computer should select square to win - bottom row" do
    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, 3, 4, 5, 6, 7, "O", "O"]

      expect(square).to eq 7
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, 3, 4, 5, 6, "O", 8, "O"]

      expect(square).to eq 8
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, 3, 4, 5, 6, "O", "O", 9]

      expect(square).to eq 9
    end
  end

  describe "computer should select square to win - first column" do
    it "should select winning option for the first column" do
      square = Strategy.move [1, 2, 3, "O", 5, 6, "O", 8, 9]

      expect(square).to eq 1
    end

    it "should select winning option for the top row" do
      square = Strategy.move ["O", 2, 3, 4, 5, 6, "O", 8, 9]

      expect(square).to eq 4
    end

    it "should select winning option for the top row" do
      square = Strategy.move ["O", 2, 3, "O", 5, 6, 7, 8, 9]

      expect(square).to eq 7
    end
  end

  describe "computer should select square to win - second column" do
    it "should select winning option for the first column" do
      square = Strategy.move [1, 2, 3, 4, "O", 6, 7, "O", 9]

      expect(square).to eq 2
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, "O", 3, 4, 5, 6, 7, "O", 9]

      expect(square).to eq 5
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, "O", 3, 4, "O", 6, 7, 8, 9]

      expect(square).to eq 8
    end
  end

  describe "computer should select square to win - third column" do
    it "should select winning option for the first column" do
      square = Strategy.move [1, 2, 3, 4, 5, "O", 7, 8, "O"]

      expect(square).to eq 3
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, "O", 4, 5, 6, 7, 8, "O"]

      expect(square).to eq 6
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, "O", 4, 5, "O", 7, 8, 9]

      expect(square).to eq 9
    end
  end

  describe "computer should select square to win - diagonal" do
    it "should select winning option for the right to left diagonal" do
      square = Strategy.move [1, 2, "O", 4, 5, 6, "O", 8, 9]

      expect(square).to eq 5
    end

    it "should select winning option for the left to right diagonal" do
      square = Strategy.move ["O", 2, 3, 4, "O", 6, 7, 8, 9]

      expect(square).to eq 9
    end
  end

  describe "computer should select square to prevent player winning - across" do
    it "should select option top row" do
      square = Strategy.move ["X", 2, "X", 4, 5, 6, "O", 8, 9]

      expect(square).to eq 2
    end

    it "should select option middle row" do
      square = Strategy.move ["X", 2, 3, "X", "X", 6, "O", 8, 9]

      expect(square).to eq 6
    end

    it "should select option bottom row" do
      square = Strategy.move ["O", 2, 3, 4, "O", 6, "X", "X", 9]

      expect(square).to eq 9
    end
  end

  describe "computer should select square to prevent player winning - down" do
    it "should select option first column" do
      square = Strategy.move ["X", 2, 3, "X", "O", 6, 7, 8, 9]

      expect(square).to eq 7
    end

    it "should select option second column" do
      square = Strategy.move [1, "X", 3, "O", "X", 6, 7, 8, 9]

      expect(square).to eq 8
    end

    it "should select option third column" do
      square = Strategy.move [1, 2, "X", 4, "O", 6, 7, 8, "X"]

      expect(square).to eq 6
    end
  end

  describe "computer should select square to prevent player winning - diagonal" do
    it "should select option left to right" do
      square = Strategy.move ["X", 2, 3, 4, "X", "O", 7, 8, 9]

      expect(square).to eq 9
    end

    it "should select option right to left" do
      square = Strategy.move [1, 2, "X", 4, "X", 6, 7, "O", 9]

      expect(square).to eq 7
    end
  end
end
