class Winner
  WINNING_COMBINATION = "X-X-X"

  def initialize combinations
    @combinations = combinations
  end

  def is_win
    if is_top_row
      true
    elsif is_middle_row
      true
    else
      false
    end
  end

  private
    def is_top_row
      @combinations.slice(0, 3).join("-") == WINNING_COMBINATION
    end

    def is_middle_row
      @combinations.slice(3, 3).join("-") == WINNING_COMBINATION
    end
end
