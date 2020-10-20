class Strategy
  NO_SELECTION = 0
  PLAYER_MARK = "X"
  COMPUTER_MARK = "O"

  def self.move combinations
    selection = computer_turn combinations

    selection = get_winning_selection combinations unless selection > NO_SELECTION

    selection = get_blocking_selection combinations unless selection > NO_SELECTION

    selection = get_square_to_make_player_block combinations unless selection > NO_SELECTION

    selection
  end

  private

  def self.computer_turn combinations
    if is_first_turn combinations
      if combinations.include?(5)
        5
      else
        1
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

  def self.get_square_to_make_player_block combinations
    available_squares = combinations.filter { |o| o.is_a? Integer }
    2-5-8
    4-5-6
    1-5-9
    3-5-6

    if available_squares.count == 6
      #computer's second turn
      #2, 4, 6 & 8 with 5 to form an across or down pair with an empty third square
      if combinations.include?(2) && combinations.include?(8)
        return 2
      else
        return 4
      end
    else
      #computer's third turn
      if available_squares.include?(3)
        return 3
      end
    end

    NO_SELECTION
  end
end
