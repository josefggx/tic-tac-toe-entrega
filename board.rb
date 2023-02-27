# frozen_string_literal: true

require_relative 'colorize'

class Board
  include Colorize

  attr_reader :board_positions

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @board_positions = (1..9).to_a
  end

  def display_board
    cells = @board_positions.map { |cell| cell.to_s.gray }
    "\n#{cells[0]} | #{cells[1]} | #{cells[2]}\n--+---+--\n" \
    "#{cells[3]} | #{cells[4]} | #{cells[5]}\n--+---+--\n" \
    "#{cells[6]} | #{cells[7]} | #{cells[8]}\n"
  end

  def update_board(position, actual_player)
    board_positions[position - 1] = actual_player.mark
  end

  def check_winner(actual_player)
    WIN_COMBINATIONS.find do |combo|
      combo.all? { |i| @board_positions[i] == actual_player.mark }
    end
  end
end
