# frozen_string_literal: true

require_relative 'player'
require_relative 'display'

class Human < Player
  include Display

  def name=(name)
    @name = name == '' ? @name : name
  end

  def name_selection
    self.name = prompt(player_name_message(@name))
    clear
  end
end
