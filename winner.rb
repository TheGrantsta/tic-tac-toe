class Winner
  WINNING_COMBINATION = "X-X-X"

  def initialize combinations
    @combinations = combinations
  end

  def is_win
    is_winner = false

    array_of_checkers = [
      method(:is_top_row_match), method(:is_middle_row_match), method(:is_bottom_row_match),
      method(:is_first_column_match), method(:is_second_column_match), method(:is_third_column_match),
      method(:is_left_to_right_diagonal_match), method(:is_right_to_left_diagonal_match)
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
      is_match @combinations.slice(0, 3).join("-")
    end

    def is_middle_row_match
      is_match @combinations.slice(3, 3).join("-")
    end

    def is_bottom_row_match
      is_match @combinations.slice(6, 3).join("-")
    end

    def is_first_column_match
      is_match "#{@combinations[0]}-#{@combinations[3]}-#{@combinations[6]}"
    end

    def is_second_column_match
      is_match "#{@combinations[1]}-#{@combinations[4]}-#{@combinations[7]}"
    end

    def is_third_column_match
      is_match "#{@combinations[2]}-#{@combinations[5]}-#{@combinations[8]}"
    end

    def is_left_to_right_diagonal_match
      is_match "#{@combinations[0]}-#{@combinations[4]}-#{@combinations[8]}"
    end

    def is_right_to_left_diagonal_match
      is_match "#{@combinations[2]}-#{@combinations[4]}-#{@combinations[6]}"
    end

    def is_match input
      input == WINNING_COMBINATION
    end
end
