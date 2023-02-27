# frozen_string_literal: true

module Colorize
  class ::String
    def colorize(color_code)
      "\e[#{color_code}m#{self}\e[0m"
    end

    def black = colorize(30)
    def red = colorize(31)
    def green = colorize(32)
    def yellow = colorize(33)
    def blue = colorize(34)
    def pink = colorize(35)
    def cyan = colorize(36)
    def gray = colorize(37)
    def white2 = colorize(38)
    def white1 = colorize(39)

    def bg_black = colorize(40)
    def bg_red = colorize(41)
    def bg_green = colorize(42)
    def bg_brown = colorize(43)
    def bg_blue = colorize(44)
    def bg_magenta = colorize(45)
    def bg_cyan = colorize(46)
    def bg_gray = colorize(47)

    def bold = "\e[1m#{self}\e[22m"
    def italic = "\e[3m#{self}\e[23m"
    def underline = "\e[4m#{self}\e[24m"
    def blink = "\e[5m#{self}\e[25m"
    def reverse_color = "\e[7m#{self}\e[27m"
  end
end
