class Strategy
  NO_SELECTION = 0
  PLAYER_MARK = "X"
  COMPUTER_MARK = "O"

  def self.move combinations
    selection = computer_turn combinations

    selection = get_winning_selection combinations unless selection > NO_SELECTION

    selection = get_blocking_selection combinations unless selection > NO_SELECTION

    selection = get_square_across_or_top_to_make_player_block combinations unless selection > NO_SELECTION

    selection = get_square_to_complete_block combinations unless selection > NO_SELECTION

    selection
  end

  private

  def self.computer_turn combinations
    if is_first_turn combinations
      if combinations.include?(5)
        5
      else
        2
      end
    else
      NO_SELECTION
    end
  end

  def self.is_first_turn combinations
    !combinations.include?("O")
  end

  def self.get_winning_selection combinations
    square = is_across_win combinations, COMPUTER_MARK, PLAYER_MARK

    square = is_down_win combinations, COMPUTER_MARK, PLAYER_MARK unless square > NO_SELECTION

    square = is_diagonal_win combinations, COMPUTER_MARK, PLAYER_MARK unless square > NO_SELECTION

    square
  end

  def self.get_blocking_selection combinations
    square = is_across_block combinations, PLAYER_MARK, COMPUTER_MARK

    square = is_down_block combinations, PLAYER_MARK, COMPUTER_MARK unless square > NO_SELECTION

    square = is_diagonal_block combinations, PLAYER_MARK, COMPUTER_MARK unless square > NO_SELECTION

    square
  end

  def self.is_across_win combinations, twoOf, noneOf
    is_across combinations, twoOf, noneOf
  end

  def self.is_across_block combinations, twoOf, noneOf
    is_across combinations, twoOf, noneOf
  end

  def self.is_across combinations, twoOf, noneOf
    [0,3,6].each do |c|
      options = combinations.slice(c, 3)
      if options.filter { |o| o == twoOf }.count == 2 && options.filter { |o| o == noneOf }.count == 0
        return combinations.slice(c, 3).filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def self.is_down_win combinations, twoOf, noneOf
    is_down combinations, twoOf, noneOf
  end

  def self.is_down_block combinations, twoOf, noneOf
    is_down combinations, twoOf, noneOf
  end

  def self.is_down combinations, twoOf, noneOf
    [0,1,2].each do |c|
      options = []
      options.push combinations[c]
      options.push combinations[c + 3]
      options.push combinations[c + 6]
      if options.filter { |o| o == twoOf }.count == 2 && options.filter { |o| o == noneOf }.count == 0
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def self.is_diagonal_win combinations, twoOf, noneOf
    is_diagonal combinations, twoOf, noneOf
  end

  def self.is_diagonal_block combinations, twoOf, noneOf
    is_diagonal combinations, twoOf, noneOf
  end

  def self.is_diagonal combinations, twoOf, noneOf
    [0,2].each do |c|
      options = []
      options.push combinations[8 - c]
      options.push combinations[4]
      options.push combinations[c]
      if options.filter { |o| o == twoOf }.count == 2 && options.filter { |o| o == noneOf }.count == 0
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def self.get_square_across_or_top_to_make_player_block combinations
    rows = {"2" => [2, 5, 8], "4" => [4, 5, 6] }

    rows.keys.each do |v|
      squares = "#{combinations[rows[v][0] - 1]}-#{combinations[rows[v][1] - 1]}-#{combinations[rows[v][2] - 1]}"

      if !squares.include?(PLAYER_MARK)
        rows[v].each do |s|
          if combinations[s - 1] != COMPUTER_MARK
            return combinations[s - 1]
          end
        end
      end
    end

    NO_SELECTION
  end

  def self.get_square_to_complete_block combinations
    blocks = {
      "top-left" => [1, 2, 4, 5],
      "top-right" => [2, 3, 5, 6],
      "bottom-left" => [4, 5, 7, 8],
      "bottom-right" => [5, 6, 8, 9]
    }

    blocks.keys.each do |b|
      squares = []
      blocks[b].each do |s|
        squares.push combinations[s - 1]
      end

      if squares.filter { |o| o == PLAYER_MARK }.count == 2 && squares.filter { |o| o.is_a? Integer }.count == 1
        return squares.filter { |o| o.is_a? Integer }.first
      end
    end

    NO_SELECTION
  end
end
