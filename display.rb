# frozen_string_literal: true

require_relative 'colorize'

module Display
  include Colorize

  def prompt(message)
    puts message
    gets.chomp
  end

  def clear
    system('clear') || system('cls')
  end

  def welcome_message
    "\nBienvenido a #{'Tic'.yellow} #{'Tac'.cyan} #{'Toe'.pink}!\n\n"
  end

  def game_mode_message
    "Ingresa un #{'número'.green} para seleccionar el modo de juego:\n" \
    "#{'1'.green}. Human vs Human | #{'2'.green}. Human vs AI | #{'3'.green}. AI vs AI\n"
  end

  def invalid_game_mode_message
    "\nPor favor, selecciona un modo de juego válido, o ingresa '#{'exit'.red}' para salir.\n\n"
  end

  def player_name_message(player_name)
    "\n#{player_name}: Por favor ingresa tu nombre:"
  end

  def move_selection_message(player, error)
    return "\n#{player.name} - #{player.mark}: Ingresa una posición disponible en el tablero:" unless error

    "\n#{error}\n#{player.name} - #{player.mark}: Ingresa una posición disponible en el tablero:"
  end

  def invalid_move_range_message
    'Posición inválida. Selection una posición entre 1-9.'
  end

  def invalid_move_filled_message
    'Esta casilla está llena. Selecciona una posición que esté vacía.'
  end

  def winner_message(actual_player)
    "\n#{actual_player.name.send(actual_player.color)} es el ganador!"
  end

  def tie_message
    "\nEmpate! No hay ganador."
  end

  def play_again_message
    "\nIngresa '#{'Y'.green}' para jugar nuevamente, o cualquier otra tecla para #{'salir'.red}."
  end

  def thanks_for_playing_message
    'Gracias por jugar!'
  end
end
