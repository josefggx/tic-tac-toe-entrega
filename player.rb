# frozen_string_literal: true

class Player
  attr_reader :name, :mark, :selected_positions, :color

  def initialize(name, mark, color)
    @name = name
    @color = color
    @mark = mark.send(color)
  end

  def position_selector(_board, error)
    puts move_selection_message(self, error)
    gets.chomp.to_i
  end
end
