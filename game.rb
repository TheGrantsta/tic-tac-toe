require_relative "winner"

class Game
  attr_reader :grid, :is_playing

  def initialize starting_gird
    @grid = starting_gird
    @is_playing = true
    @moves = []
  end

  def display_grid
    " #{@grid.slice(0, 3).join(" | ")} \n #{@grid.slice(3, 3).join(" | ")} \n #{@grid.slice(6, 3).join(" | ")}"
  end

  def display_moves
    "Moves: #{@moves.join("; ")}"
  end

  def available_squares
    "Please select available square: #{@grid.filter{ |o| o.is_a? Integer }.join(", ") }"
  end

  def add_player_choice player_choice
    winner = Winner.new @grid
    if is_square_available(player_choice) && !winner.is_game_over
      add_choice player_choice, "X"
      @moves.push "P #{player_choice}"
      add_computer_choice @grid.filter{|o| o.is_a? Integer}.first if @is_playing
    end
    is_continue
  end

  def add_computer_choice computer_choice
    winner = Winner.new @grid
    if (computer_choice.is_a? Integer) && !winner.is_game_over
      add_choice computer_choice, "O"
      @moves.push "C #{computer_choice}"
    end
  end

  def display_result
    winner = Winner.new @grid
    if winner.is_player_win
      "Player won!"
    elsif winner.is_computer_win
      "Computer won!"
    else
      "Game drawn"
    end
  end

  private

  def is_continue
    winner = Winner.new @grid
    @is_playing = @grid.filter {|o| o.is_a? Integer}.size > 0 &&  !winner.is_game_over
  end

  def is_square_available choice
    @grid[choice - 1] != "X" && @grid[choice - 1] != "O"
  end

  def add_choice choice, mark
    @grid[choice - 1] = mark
  end
end
