class Winner
  WINNING_COMBINATION = "X-X-X"

  def initialize combinations
    @combinations = combinations
  end

  def is_win
    is_winner = false
    [method(:is_across_match), method(:is_down_match), method(:is_diagonal_match)].each do |checker|
      if checker.call
        is_winner = true
        break
      end
    end
    is_winner
  end

  private
    def is_across_match
      is_across_win = false
      [0,3,6].each do |c|
        if is_match(@combinations.slice(c, 3).join("-"))
          is_across_win = true
          break
        end
      end
      is_across_win
    end

    def is_down_match
      is_down_win = false
      [0,1,2].each do |c|
        if is_match("#{@combinations[c]}-#{@combinations[c + 3]}-#{@combinations[c + 6]}")
          is_down_win = true
          break
        end
      end
      is_down_win
    end

    def is_diagonal_match
      is_diagonal_win = false
      [0,2].each do |c|
        if is_match("#{@combinations[(8 - c).abs]}-#{@combinations[4]}-#{@combinations[c]}")
          is_diagonal_win = true
          break
        end
      end
      is_diagonal_win
    end

    def is_match input
      input == WINNING_COMBINATION
    end
end
