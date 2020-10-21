require_relative "winner"
require_relative "strategy"

class Game
  attr_reader :grid, :is_playing

  PLAYER_MARK = "X"
  COMPUTER_MARK = "O"

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
      add_choice player_choice, PLAYER_MARK
      @moves.push "P #{player_choice}"
      add_computer_choice get_computer_choice if @is_playing
    end
    is_continue
  end

  def add_computer_choice computer_choice
    winner = Winner.new @grid
    if (computer_choice.is_a? Integer) && !winner.is_game_over
      add_choice computer_choice, COMPUTER_MARK
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
  def get_computer_choice
    strategy = Strategy.new @grid

    next_move = strategy.move

    next_move = @grid.filter{|o| o.is_a? Integer}.first unless next_move > 0

    next_move
  end

  def is_continue
    winner = Winner.new @grid
    @is_playing = @grid.filter {|o| o.is_a? Integer}.size > 0 &&  !winner.is_game_over
  end

  def is_square_available choice
    @grid[choice - 1] != PLAYER_MARK && @grid[choice - 1] != COMPUTER_MARK
  end

  def add_choice choice, mark
    @grid[choice - 1] = mark
  end
end
