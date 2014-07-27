module Tetris
  module UI
    class ColorParser

      def self.parse_file_name color
        if color == Engine::Constants::RED
          'assets/red_shape.tiff'
        elsif color == Engine::Constants::BLUE
          'assets/blue_shape.tiff'
        elsif color == Engine::Constants::NONE
          'assets/background_block.tiff'
        end
      end

      def self.parse_color color
        case color
        when Engine::Constants::BLUE then Gosu::Color::BLUE
        when Engine::Constants::GREEN then Gosu::Color::GREEN
        when Engine::Constants::RED then Gosu::Color::RED
        when Engine::Constants::AQUA then Gosu::Color::AQUA
        when Engine::Constants::YELLOW then Gosu::Color::YELLOW
        when Engine::Constants::CYAN then Gosu::Color::CYAN
        when Engine::Constants::FUCHSIA then Gosu::Color::FUCHSIA
        when Engine::Constants::NONE then Gosu::Color::NONE
        else Gosu::Color::RED end
      end
    end
  end
end
