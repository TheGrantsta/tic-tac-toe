require_relative "strategy"

RSpec.describe Strategy do
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

      expect(square).to eq 0
    end

    it "should not select winning option for the first column" do
      square = Strategy.move ["O", 2, 3, "X", 5, 6, "O", 8, 9]

      expect(square).to eq 0
    end
  end

  describe "computer should select square to win - top row" do
    it "should select winning option for the top row" do
      square = Strategy.move [1, "O", "O"]

      expect(square).to eq 1
    end

    it "should select winning option for the top row" do
      square = Strategy.move ["O", 2, "O"]

      expect(square).to eq 2
    end

    it "should select winning option for the top row" do
      square = Strategy.move ["O", "O", 3]

      expect(square).to eq 3
    end
  end

  describe "computer should select square to win - middle row" do
    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, 3, 4, "O", "O"]

      expect(square).to eq 4
    end

    it "should select winning option for the top row" do
      square = Strategy.move [1, 2, 3, "O", 5, "O"]

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
end
