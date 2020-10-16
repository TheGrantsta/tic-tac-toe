class Game
  attr_reader :grid, :is_playing

  def initialize starting_gird
    @grid = starting_gird
    @is_playing = true
  end

  def display_grid
    "Grid: #{@grid.join(", ")}"
  end

  def available_squares
    "Please select available square: #{@grid.filter{ |o| o.is_a? Integer }.join(", ") }"
  end

  def add_player_choice player_choice
    add_choice player_choice, "X"
    @is_playing = @grid.filter{ |o| o.is_a? Integer }.size > 0
  end

  def add_computer_choice computer_choice
    add_choice computer_choice, "O"
    @is_playing = @grid.filter{ |o| o.is_a? Integer }.size > 0
  end

  private

  def add_choice square, mark
    @grid[square - 1] = mark unless @grid[square - 1] == "O"
  end
end
