class Winner
  WINNING_COMBINATION = "X-X-X"

  def self.is_win combinations
    top_row = combinations.slice(0, 3).join("-")

    top_row == WINNING_COMBINATION
  end
end
