class Strategy
  def self.move combinations
    selection = 0

    if is_first_turn combinations
      if combinations.include?(5)
        selection = 5
      else
        selection = 1
      end
    else
      selection = get_winning_selection combinations
    end

    selection
  end

  private

  def self.is_first_turn combinations
    !combinations.include?("O")
  end

  def self.get_winning_selection combinations
    square = is_across_win combinations

    if square == 0
      square = is_down_win combinations
    end

    square
  end

  def self.is_across_win combinations
    [0,3,6].each do |c|
      if combinations.slice(c, 3).filter { |o| o.is_a? String }.count == 2
        return combinations.slice(c, 3).filter { |o| o.is_a? Integer }[0]
      end
    end
    0
  end

  def self.is_down_win combinations
    [0,1,2].each do |c|
      options = []
      options.push combinations[c]
      options.push combinations[c + 3]
      options.push combinations[c + 6]
      if options.filter { |o| o.is_a? String }.count == 2
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    0
  end
end
