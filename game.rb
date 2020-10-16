class Game
  attr_reader :grid

  def initialize starting_gird
    @grid = starting_gird
  end

  def add_player_choice player_choice
    add_choice player_choice, "X"
  end

  def add_computer_choice computer_choice
    add_choice computer_choice, "O"
  end

  private
  def add_choice square, mark
    @grid[square] = mark
  end
end
