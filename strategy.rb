class Strategy
  NO_SELECTION = 0

  def self.move combinations
    selection = computer_turn combinations

    selection = get_winning_selection combinations unless selection > NO_SELECTION

    selection = get_blocking_selection combinations unless selection > NO_SELECTION

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
    square = is_across_win combinations

    square = is_down_win combinations unless square > 0

    square = is_diagonal_win combinations unless square > 0

    square
  end

  def self.get_blocking_selection combinations
    square = is_across_block combinations

    square = is_down_block combinations unless square > 0

    square = is_diagonal_block combinations unless square > 0

    square
  end

  def self.is_across_win combinations
    [0,3,6].each do |c|
      options = combinations.slice(c, 3)
      if options.filter { |o| o == "O" }.count == 2 && options.filter { |o| o == "X" }.count == 0
        return combinations.slice(c, 3).filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def self.is_down_win combinations
    [0,1,2].each do |c|
      options = []
      options.push combinations[c]
      options.push combinations[c + 3]
      options.push combinations[c + 6]
      if options.filter { |o| o == "O" }.count == 2 && options.filter { |o| o == "X" }.count == 0
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def self.is_diagonal_win combinations
    [0,2].each do |c|
      options = []
      options.push combinations[8 - c]
      options.push combinations[4]
      options.push combinations[c]
      if options.filter { |o| o == "O" }.count == 2 && options.filter { |o| o == "X" }.count == 0
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def self.is_across_block combinations
    [0,3,6].each do |c|
      options = combinations.slice(c, 3)
      if options.filter { |o| o == "X" }.count == 2 && options.filter { |o| o == "O" }.count == 0
        return combinations.slice(c, 3).filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def self.is_down_block combinations
    [0,1,2].each do |c|
      options = []
      options.push combinations[c]
      options.push combinations[c + 3]
      options.push combinations[c + 6]
      if options.filter { |o| o == "X" }.count == 2 && options.filter { |o| o == "O" }.count == 0
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def self.is_diagonal_block combinations
    [0,2].each do |c|
      options = []
      options.push combinations[8 - c]
      options.push combinations[4]
      options.push combinations[c]
      if options.filter { |o| o == "X" }.count == 2 && options.filter { |o| o == "O" }.count == 0
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end
end
