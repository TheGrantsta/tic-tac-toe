require_relative "strategy"

RSpec.describe Strategy do
  it "computer should select middle square of grid if available" do
    square = Strategy.move ["X", 2, 3, 4, 5, 6, 7, 8, 9]

    expect(square).to eq 5
  end

  it "computer should select first square of grid if middle square is taken" do
    square = Strategy.move [1, 2, 3, 4, "X", 6, 7, 8, 9]

    expect(square).to eq 1
  end
end
