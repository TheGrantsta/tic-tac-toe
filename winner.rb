class Winner

  def initialize combinations
    @combinations = combinations
    @winning_combination = ""
    @methods = [method(:is_across_match), method(:is_down_match), method(:is_diagonal_match)]
  end

  def is_game_over
    is_player_win || is_computer_win
  end

  def is_player_win
    is_winning_combination "X-X-X"
  end

  def is_computer_win
    is_winning_combination "O-O-O"
  end

  private
    def is_winning_combination combination
      @winning_combination = combination
      @methods.each do |checker|
        if checker.call
          return true
        end
      end
      false
    end

    def is_across_match
      [0,3,6].each do |c|
        if is_match(@combinations.slice(c, 3).join("-"))
          return true
        end
      end
      false
    end

    def is_down_match
      [0,1,2].each do |c|
        if is_match("#{@combinations[c]}-#{@combinations[c + 3]}-#{@combinations[c + 6]}")
          return true
        end
      end
      false
    end

    def is_diagonal_match
      [0,2].each do |c|
        if is_match("#{@combinations[8 - c]}-#{@combinations[4]}-#{@combinations[c]}")
          return true
        end
      end
      false
    end

    def is_match input
      input == @winning_combination
    end
end
