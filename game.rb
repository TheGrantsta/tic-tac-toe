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
    if is_square_available player_choice
      add_choice player_choice, "X"
      @is_playing = @grid.filter{ |o| o.is_a? Integer }.size > 0
      add_computer_choice @grid.filter{|o| o.is_a? Integer}.first if @is_playing
    end

  end

  def add_computer_choice computer_choice
    add_choice computer_choice, "O"
    @is_playing = @grid.filter{ |o| o.is_a? Integer }.size > 0
  end

  private

  def is_square_available choice
    @grid[choice - 1] != "X" && @grid[choice - 1] != "O"
  end

  def add_choice choice, mark
    @grid[choice - 1] = mark unless @grid[choice - 1] == "O"
  end
end
