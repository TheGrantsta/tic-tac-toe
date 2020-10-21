class Strategy
  NO_SELECTION = 0
  PLAYER_MARK = "X"
  COMPUTER_MARK = "O"

  game_moves = []

  def initialize moves
    @game_moves = moves
  end

  def move
    selection = computer_turn

    selection = get_winning_selection unless selection > NO_SELECTION

    selection = get_blocking_selection unless selection > NO_SELECTION

    selection = get_square_to_make_player_block unless selection > NO_SELECTION

    selection = get_square_to_complete_block unless selection > NO_SELECTION

    selection
  end

  private

  def computer_turn
    if is_first_turn
      if @game_moves.include?(5)
        5
      else
        1
      end
    else
      NO_SELECTION
    end
  end

  def is_first_turn
    !@game_moves.include?("O")
  end

  def get_winning_selection
    square = is_across_win COMPUTER_MARK, PLAYER_MARK

    square = is_down_win COMPUTER_MARK, PLAYER_MARK unless square > NO_SELECTION

    square = is_diagonal_win COMPUTER_MARK, PLAYER_MARK unless square > NO_SELECTION

    square
  end

  def get_blocking_selection
    square = is_across_block PLAYER_MARK, COMPUTER_MARK

    square = is_down_block PLAYER_MARK, COMPUTER_MARK unless square > NO_SELECTION

    square = is_diagonal_block PLAYER_MARK, COMPUTER_MARK unless square > NO_SELECTION

    square
  end

  def is_across_win twoOf, noneOf
    is_across twoOf, noneOf
  end

  def is_across_block twoOf, noneOf
    is_across twoOf, noneOf
  end

  def is_across twoOf, noneOf
    [0,3,6].each do |c|
      options = @game_moves.slice(c, 3)
      if options.filter { |o| o == twoOf }.count == 2 && options.filter { |o| o == noneOf }.count == 0
        return @game_moves.slice(c, 3).filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def is_down_win twoOf, noneOf
    is_down twoOf, noneOf
  end

  def is_down_block twoOf, noneOf
    is_down twoOf, noneOf
  end

  def is_down twoOf, noneOf
    [0,1,2].each do |c|
      options = []
      options.push @game_moves[c]
      options.push @game_moves[c + 3]
      options.push @game_moves[c + 6]
      if options.filter { |o| o == twoOf }.count == 2 && options.filter { |o| o == noneOf }.count == 0
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def is_diagonal_win twoOf, noneOf
    is_diagonal twoOf, noneOf
  end

  def is_diagonal_block twoOf, noneOf
    is_diagonal twoOf, noneOf
  end

  def is_diagonal twoOf, noneOf
    [0,2].each do |c|
      options = []
      options.push @game_moves[8 - c]
      options.push @game_moves[4]
      options.push @game_moves[c]
      if options.filter { |o| o == twoOf }.count == 2 && options.filter { |o| o == noneOf }.count == 0
        return options.filter { |o| o.is_a? Integer }[0]
      end
    end
    NO_SELECTION
  end

  def get_square_to_make_player_block
    rows = {"2" => [2, 5, 8], "4" => [4, 5, 6] }

    rows.keys.each do |v|
      squares = "#{@game_moves[rows[v][0] - 1]}-#{@game_moves[rows[v][1] - 1]}-#{@game_moves[rows[v][2] - 1]}"

      if !squares.include?(PLAYER_MARK)
        rows[v].each do |s|
          if @game_moves[s - 1] != COMPUTER_MARK
            return @game_moves[s - 1]
          end
        end
      end
    end

    if @game_moves.filter { |o| o.is_a? Integer }.count == 6
      if @game_moves[4] == PLAYER_MARK && @game_moves[8] == PLAYER_MARK
        return 3
      end
    end

    NO_SELECTION
  end

  def get_square_to_complete_block
    blocks = {
      "top-left" => [1, 2, 4, 5],
      "top-right" => [2, 3, 5, 6],
      "bottom-left" => [4, 5, 7, 8],
      "bottom-right" => [5, 6, 8, 9]
    }

    blocks.keys.each do |b|
      squares = []
      blocks[b].each do |s|
        squares.push @game_moves[s - 1]
      end

      if squares.filter { |o| o == PLAYER_MARK }.count == 2 && squares.filter { |o| o.is_a? Integer }.count == 1
        return squares.filter { |o| o.is_a? Integer }.first
      end
    end

    NO_SELECTION
  end
end
