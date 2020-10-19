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
      square = Strategy.move ["O", "0", 3]

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
      square = Strategy.move [1, 2, 3, "O", "0", 6]

      expect(square).to eq 6
    end
  end

end
