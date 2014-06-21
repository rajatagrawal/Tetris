module Tetris
  module UI
    class ColorParser
      def self.parse_color color
        case color
        when 'blue'
          Gosu::Color::BLUE
        when 'green'
          Gosu::Color::GREEN
        when 'red'
          Gosu::Color::RED
        when 'aqua'
          Gosu::Color::AQUA
        when 'yellow'
          Gosu::Color::YELLOW
        when 'cyan'
          Gosu::Color::CYAN
        when 'fuchsia'
          Gosu::Color::FUCHSIA
        when 'none'
          Gosu::Color::NONE
        else
          Gosu::Color::RED
        end
      end
    end
  end
end
