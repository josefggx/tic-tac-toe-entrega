# frozen_string_literal: true

require_relative 'player'

class Computer < Player
  def position_selector(board, _error)
    puts "\n#{name} - #{mark} playing"
    sleep 0.7
    free_positions = board.board_positions.grep(Integer)
    free_positions.sample.to_i
  end

  def name_selection; end
end
