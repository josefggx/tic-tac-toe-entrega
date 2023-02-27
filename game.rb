# frozen_string_literal: true

require_relative 'display'
require_relative 'board'
require_relative 'human'
require_relative 'computer'

class Game
  include Display

  def play_game
    clear
    puts welcome_message
    game_mode_selector
  end

  private

  def game_mode_selector
    game_mode = prompt(game_mode_message).downcase

    case game_mode
    when '1' then play_human_vs_human
    when '2' then play_human_vs_ai
    when '3' then play_ai_vs_ai
    when 'exit' then nil
    else clear
         puts invalid_game_mode_message
         game_mode_selector
    end
  end

  def start_game(player1, player2)
    @actual_player = player1
    @board = Board.new
    @turn_number = 0

    clear
    name_selector(player1, player2)
    start_turn(player1, player2)
    play_again
  end

  def play_human_vs_human
    player1 = Human.new('Jugador 1', 'X', 'cyan')
    player2 = Human.new('Jugador 2', 'O', 'pink')

    start_game(player1, player2)
  end

  def play_human_vs_ai
    player1 = Human.new('Jugador 1', 'X', 'cyan')
    player2 = Computer.new('Regular AI', 'O', 'pink')

    start_game(player1, player2)
  end

  def play_ai_vs_ai
    player1 = Computer.new('Blue AI', 'X', 'cyan')
    player2 = Computer.new('Pink AI', 'O', 'pink')

    start_game(player1, player2)
  end

  def name_selector(player1, player2)
    player1.name_selection
    player2.name_selection
  end

  def start_turn(player1, player2, error = nil)
    clear
    puts @board.display_board

    selected_position = @actual_player.position_selector(@board, error)
    check_position(player1, player2, selected_position)
  end

  def play_turn(player1, player2, selected_position)
    @turn_number += 1
    @board.update_board(selected_position, @actual_player)
    return game_result if game_end?

    change_active_player(player1, player2)
    start_turn(player1, player2, nil)
  end

  def change_active_player(player1, player2)
    @actual_player = player1 == @actual_player ? player2 : player1
  end

  def check_position(player1, player2, selected_position)
    if !(1..9).include?(selected_position)
      start_turn(player1, player2, invalid_move_range_message)
    elsif @board.board_positions[selected_position - 1] == selected_position
      play_turn(player1, player2, selected_position)
    else
      start_turn(player1, player2, invalid_move_filled_message)
    end
  end

  def game_end?
    @turn_number == 9 || @board.check_winner(@actual_player)
  end

  def game_result
    clear
    puts @board.display_board

    if @board.check_winner(@actual_player)
      puts winner_message(@actual_player)
    elsif @turn_number == 9
      puts tie_message
    end
  end

  def play_again
    sleep 0.4
    play_again = prompt(play_again_message).upcase
    return play_game if play_again == 'Y'

    puts thanks_for_playing_message
  end
end

game = Game.new
game.play_game
