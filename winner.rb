class Winner
  WINNING_COMBINATION = "X-X-X"

  def initialize combinations
    @combinations = combinations
  end

  def is_win
    is_winner = false

    array_of_checkers = [
      method(:is_top_row_match), method(:is_middle_row_match), method(:is_bottom_row_match),
      method(:is_first_column_match), method(:is_second_column_match)
    ]

    array_of_checkers.each do |checker|
      if checker.call
        is_winner = true
      end
    end

    is_winner
  end

  private
    def is_top_row_match
      @combinations.slice(0, 3).join("-") == WINNING_COMBINATION
    end

    def is_middle_row_match
      @combinations.slice(3, 3).join("-") == WINNING_COMBINATION
    end

    def is_bottom_row_match
      @combinations.slice(6, 3).join("-") == WINNING_COMBINATION
    end

    def is_first_column_match
      "#{@combinations[0]}-#{@combinations[3]}-#{@combinations[6]}" == WINNING_COMBINATION
    end

    def is_second_column_match
      "#{@combinations[1]}-#{@combinations[4]}-#{@combinations[7]}" == WINNING_COMBINATION
    end
end
