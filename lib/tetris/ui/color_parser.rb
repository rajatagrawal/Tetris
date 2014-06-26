module Tetris
  module UI
    class ColorParser

      def self.parse_file_name color
        if color == 'red'
          'assets/red_shape.tiff'
        elsif color == 'blue'
          'assets/blue_shape.tiff'
        elsif color == 'none'
          'assets/background_block.tiff'
        end
      end

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
